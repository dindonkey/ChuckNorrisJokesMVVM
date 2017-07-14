import UIKit
import RxSwift
import RxCocoa

class JokesViewController: UIViewController {

    @IBOutlet weak var jokesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var jokes = Variable<[String]>(["one","two"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokes
            .asObservable()
            .bind(to: jokesTableView.rx.items(cellIdentifier: "JokeCell")) { (_, joke, cell) in
                cell.textLabel?.text = joke
            }
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

