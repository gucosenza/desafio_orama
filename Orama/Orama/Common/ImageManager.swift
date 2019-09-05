import UIKit

final class ImageManager {
    
    func thumbnailImage (thumbnail: String) -> UIImage {
        let url = URL(string: thumbnail)!
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return UIImage(named: "no-image-found-360x260.png")!
    }
    
}
