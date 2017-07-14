import UIKit
import RxSwift
import RxCocoa

class JokesViewController: UIViewController {

    @IBOutlet weak var jokesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var jokesViewModel = JokesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

