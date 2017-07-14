import Foundation
import RxSwift
import RxCocoa

class JokesViewModel {
    
    let jokes: Driver<[String]>!
    
    init() {
        jokes = Observable.just(["one","two","three"]).asDriver(onErrorJustReturn: ["error"])
    }
}
