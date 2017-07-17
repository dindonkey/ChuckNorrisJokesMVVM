import Foundation
import Mapper

struct Joke: Mappable {
    var joke: String
    
    init(_ joke: String) {
        self.joke = joke
    }
    
    init(map: Mapper) throws {
        joke = map.optionalFrom("joke")!
    }
}
