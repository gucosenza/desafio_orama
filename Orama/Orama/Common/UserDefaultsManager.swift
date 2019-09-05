import UIKit

final class UserDefaultsManager {
    
    let defaults = UserDefaults.standard
    private let key = Config.keyUserDefaults
    
    func saveHistory(simpleName: String) {
        var arrayHistory = defaults.object(forKey: key) as? [String] ?? [String]()
        arrayHistory.append(simpleName)
        defaults.set(arrayHistory, forKey: key)
    }
    
    func getHistory() -> [String] {
        return defaults.object(forKey: key) as? [String] ?? [String]()
    }
    
    func deleteKey() {
        defaults.removeObject(forKey: key)
    }

}
