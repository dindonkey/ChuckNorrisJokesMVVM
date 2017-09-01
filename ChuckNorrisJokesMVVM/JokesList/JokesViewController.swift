import UIKit
import RxSwift
import RxCocoa
import Moya
import SDWebImage

class JokesViewController: UIViewController {
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    let refreshControl = UIRefreshControl()
    var didPullToRefresh: Driver<Void>!
    
    var jokesProvider: RxMoyaProvider<JokesService>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    func setupViewModel() {
        
        didPullToRefresh =  refreshControl.rx.controlEvent(.valueChanged)
            .map { [refreshControl] in
                return refreshControl.isRefreshing
            }
            .filter { $0 == true }
            .map { _ in return () }
            .asDriver(onErrorJustReturn: ())
        
        let jokesViewModel = JokesViewModel(jokesProvider: jokesProvider, refreshDriver: didPullToRefresh)
        
        jokesTableView.refreshControl = refreshControl
        jokesViewModel.jokes
            .do(onSubscribe: { [refreshControl] _ in
                refreshControl.beginRefreshingManually()
            })
            .do(onNext: { [refreshControl] _ in
                refreshControl.endRefreshing()
            })
            .drive(jokesTableView.rx.items(cellIdentifier: "JokeCell", cellType: JokeTableViewCell.self)){ (_, joke, cell) in
                cell.jokeText.text = joke.joke
                cell.jokeImageView.sd_setImage(with: joke.jokeImage, placeholderImage: UIImage(named: "SampleChuck"))

            }
            .addDisposableTo(disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension UIRefreshControl {
    func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: true)
        }
        beginRefreshing()
    }
}

