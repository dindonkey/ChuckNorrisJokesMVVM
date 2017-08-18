import Foundation
import RxSwift
import RxCocoa
import Moya
import Moya_ModelMapper

class JokesViewModel {
    
    let jokes: Driver<[Joke]>!
    
    init(jokesProvider: RxMoyaProvider<JokesService>, refreshDriver: Driver<Void>) {
        jokes =
            refreshDriver
                .startWith(())
                .flatMap { _ in
                    jokesProvider
                        .request(.random(numJokes: 5))
                        .mapArray(type: Joke.self, keyPath: "value")
                        .asDriver(onErrorJustReturn: [Joke("error")]) }
        
    }
}
