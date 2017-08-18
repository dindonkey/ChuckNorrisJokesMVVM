import UIKit
import RxSwift
import RxCocoa
import Moya

class JokesViewController: UIViewController {
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    let refreshControl = UIRefreshControl()
    var didPullToRefresh: Observable<Void>!
    
    var jokesProvider: RxMoyaProvider<JokesService>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokesTableView.refreshControl = refreshControl
        
        didPullToRefresh =  refreshControl.rx.controlEvent(.valueChanged)
            .map { [refreshControl] in
                return refreshControl.isRefreshing
            }
            .filter { $0 == true }
            .map { _ in return () }
        
        initViewModelAndBindings()
    }
    
    func initViewModelAndBindings() {
        let jokesViewModel = JokesViewModel(jokesProvider: jokesProvider, refreshDriver: didPullToRefresh.asDriver(onErrorJustReturn: ()))
        
        jokesViewModel.jokes
            .do(onNext: { [refreshControl] _ in
                refreshControl.endRefreshing()
            })
            .drive(jokesTableView.rx.items(cellIdentifier: "JokeCell")){ (_, joke, cell) in
                cell.textLabel?.text = joke.joke
            }
            .addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

