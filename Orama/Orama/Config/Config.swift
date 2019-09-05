import Foundation

struct Config {
    
    static var keyUserDefaults: String {
        guard let value:String = Bundle.main.infoDictionary?["keyUserDefaults"] as? String else {return "erro"}
        return value
    }
    
    static var basePath: String {
        guard let value:String = Bundle.main.infoDictionary?["basePath"] as? String else {return "erro"}
        return value
    }
    
}
