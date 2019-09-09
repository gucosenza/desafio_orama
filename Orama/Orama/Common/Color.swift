import UIKit

extension UIColor {
    @objc class var oramaGreen: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "baseColor")!
        } else {
            return UIColor(red: 0.306, green: 0.498, blue: 0.039, alpha: 1.00)
        }
    }
    
    @objc class var oramaWhite: UIColor {
        if #available(iOS 11.0, *) {
            return .white
        } else {
            return UIColor.white
        }
    }
    
}
