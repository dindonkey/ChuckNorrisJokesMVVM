import UIKit

class JokeDetailViewController: UIViewController {

    @IBOutlet weak var jokeImage: UIImageView!
    @IBOutlet weak var jokeText: UITextView!
    
    var joke: Joke!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jokeText.text = joke.joke
        jokeImage.sd_setImage(with: joke.jokeImage, placeholderImage: UIImage(named: "SampleChuck"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
