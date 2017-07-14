import Foundation
import RxSwift
import RxCocoa

class JokesViewModel {
    
    let jokes: Driver<[Joke]>!
    
    init() {
        jokes = Observable.just([Joke("one"),Joke("two"),Joke("three")]).asDriver(onErrorJustReturn: [Joke("error")])
    }
}
