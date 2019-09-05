import Foundation
import Alamofire

class OramaApi {
    
    static private let basePath = Config.basePath
    
    class func loadInvestment(onComplete: @escaping ([FundInvestmentModel]) -> Void) {
        let url = basePath + "/orama-media/json/fund_detail_full.json"
        
        AF.request(url).responseJSON { (response) in
            print(response)
            response.result.ifSuccess {
//                if let welcome = response.result.value {
                let welcome = try? JSONDecoder().decode(FundInvestmentModel.self, from: response.result.value as! Data)
                    print(welcome?.simpleName)
//                }
            }
            
        }
    }
}

//            guard response.result.isSuccess,
//                let data = response.data,
//                let investment = try? JSONDecoder().decode(FundInvestmentModel.self, from: data)
//                else {
//                    print("Erro")
//                    return
//            }
//            onComplete(investment)

//    let moviesApi = try JSONDecoder().decode(MoviesApi.self, from: data)
//    onComplete(moviesApi)

//    func getAccount(completion: @escaping (String) -> Void) {
//        AF.request("https://api.imgur.com/3/account/username",
//            headers: ["Authorization": "Client-ID xxxxxxx"]).responseJSON { (response) in
//                guard response.result.isSuccess, let value = response.result.value as? [String: Any] else {
//                    print("Error \(String(describing: response.result.error))")
//                    // completion error
//                    return
//                }
//
//                guard let rows = value["data"] as? [String: Any] else {
//                    print("Malformed data received from service")
//                    // completion error
//                    return
//                }
//
//                print("URL \(String(describing: rows["url"]))")
//                print("ID \(String(describing: rows["id"]))")
//
//                DispatchQueue.main.async { // 2
//                    completion(String(describing: rows["id"] ?? ""))
//                }
//
//        }
//    }
//
//
//
//    func getRequestWithAlamofire(){
//        AF.request("https://yourApiUrl.com/get").responseJSON { response in
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//        }
//    }
//
//


//{
//                print(response.result.)
////                guard let value = response.result.value as? [FundInvestmentModel] else {
//                    print("erro")
//                    return
//                }
//                print(value)
//                onComplete(value)
//                if let json = response.result.value {
//
//                    DispatchQueue.main.async {
//                        let data = try? Data(c)
//
//                        (contentsOf: URL(fileURLWithPath: path))
//                        let funds = try! JSONDecoder().decode([FundInvestmentModel].self, from: json as! Data)
//                        onComplete(funds)
//                    }
//
//                }
