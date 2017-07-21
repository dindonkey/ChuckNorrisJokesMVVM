import Foundation
import Moya

enum JokesService {
    case random(numJokes: Int)
}

extension JokesService: TargetType {
    var baseURL: URL { return URL(string: "https://api.icndb.com")! }
    
    var path: String {
        switch self {
        case .random(let numJokes):
            return "jokes/random/\(numJokes)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .random:
            return stubbedJson("jokes")
        }
    }
    
    var task: Task {
        return .request
    }
}

extension TargetType {
    func stubbedJson(_ filename: String) -> Data! {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")
        return (try? Data(contentsOf: url!))
    }
}
