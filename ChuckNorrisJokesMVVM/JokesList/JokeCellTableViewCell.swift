import UIKit

class JokeTableViewCell: UITableViewCell {

    @IBOutlet weak var jokeText: UILabel!
    @IBOutlet weak var jokeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
