import Foundation
import Mapper

struct Joke: Mappable {
    var joke: String
    var jokeImage = URL(string: "https://i.pinimg.com/736x/44/f0/d4/44f0d4ee189b1c046c4b524361466600--too-funny-funny-pics.jpg")
    
    init(_ joke: String) {
        self.joke = joke
    }
    
    init(map: Mapper) throws {
        joke = map.optionalFrom("joke")!
    }
}
