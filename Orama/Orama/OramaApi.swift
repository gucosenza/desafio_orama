import Foundation
import Alamofire

class OramaApi {
    
    static private let basePath = "https://s3.amazonaws.com"
    
    class func loadInvestment(onComplete: @escaping (Investment) -> Void) {
        let url = basePath + "/orama-media/json/fund_detail_full.json"
        Alamofire.request(url).responseJson { (response) in
            guard let data = response.data,
                let investment = try? JSONDecoder().decode(Investment.self, from: data),
                investment.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(investment)
        }
    }
}
