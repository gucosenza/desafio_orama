import Foundation
import Alamofire

class OramaApi {
    
    static private let basePath = Config.basePath
    static private var fundsSix: [FundInvestmentModel] = []
    
    class func loadInvestment(onComplete: @escaping ([FundInvestmentModel]) -> Void) {
        let url = basePath + "/orama-media/json/fund_detail_full.json"
        
        AF.request(url)
            .responseDecodable { (response: DataResponse<[FundInvestmentModel]>) in
                if response.result.isSuccess {
                    guard let funds = response.result.value else {return}
                    
                    var indice = 0
                    while indice < 6{
                        fundsSix.append(funds[indice])
                        indice += 1
                    }
                    onComplete(fundsSix)
                }
        }
        
    }
}
