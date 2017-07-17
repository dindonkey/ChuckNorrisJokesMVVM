import Foundation
import RxSwift
import RxCocoa
import Moya
import Moya_ModelMapper

class JokesViewModel {
    
    let jokes: Driver<[Joke]>!
    let jokesProvider: RxMoyaProvider<JokesService>!
    
    init() {
        jokesProvider = RxMoyaProvider<JokesService>()
        jokes = jokesProvider
            .request(.random(numJokes: 5))
            .mapArray(type: Joke.self, keyPath: "value")
            .asDriver(onErrorJustReturn: [Joke("error")])
    }
}
