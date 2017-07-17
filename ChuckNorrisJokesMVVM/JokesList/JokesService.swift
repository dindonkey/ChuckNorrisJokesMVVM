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
            guard let url = Bundle.main.url(forResource: "jokes", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    
    var task: Task {
        return .request
    }
}
