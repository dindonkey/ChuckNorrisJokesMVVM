import UIKit
import RxSwift
import RxCocoa
import Moya

class JokesViewController: UIViewController {
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var jokesProvider: RxMoyaProvider<JokesService>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModelAndBindings()
    }
    
    func initViewModelAndBindings() {
        let jokesViewModel = JokesViewModel(jokesProvider)
        
        jokesViewModel.jokes
            .drive(jokesTableView.rx.items(cellIdentifier: "JokeCell")){ (_, joke, cell) in
                cell.textLabel?.text = joke.joke
            }
            .addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

