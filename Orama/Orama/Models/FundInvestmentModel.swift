import Foundation

struct FundInvestmentModel: Codable{
    let initialDate: String
    let operability: Operability
    let fullName: String
    let simpleName: String
    let specification: Specification
    let strategyVideo: Video?
    let fundManager: FundManager
    
    enum CodingKeys: String, CodingKey {
        case initialDate = "initial_date"
        case operability
        case fullName = "full_name"
        case simpleName = "simple_name"
        case specification
        case strategyVideo = "strategy_video"
        case fundManager = "fund_manager"
    }
    
    public func formattedInitialDate() -> String? {
        let date = initialDate
        var dateSplited = date.components(separatedBy: "-")
        let dateFormatted = "Data inicial: \(dateSplited[2])/\(dateSplited[1])/\(dateSplited[0])"
        return dateFormatted
    }
}

// MARK: - FundManager
struct FundManager: Codable {
    let fundManagerDescription: String
    
    enum CodingKeys: String, CodingKey {
        case fundManagerDescription = "description"
    }
}

// MARK: - Operability
struct Operability: Codable {
    let minimumInitialApplicationAmount: String
    
    enum CodingKeys: String, CodingKey {
        case minimumInitialApplicationAmount = "minimum_initial_application_amount"
    }
    
    public func formattedMinimumInitialApplicationAmount() -> String? {
        let value = minimumInitialApplicationAmount
        let myInteger = Double(value)
        
        let price = NSNumber(value: myInteger!)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: price)
    }
}

// MARK: - Video
struct Video: Codable {
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case thumbnail
    }
    
    public func thumbnailFormatted() -> String? {
        let str = thumbnail
        var strSplited = str?.components(separatedBy: ":")
        let strFormatted = "\(strSplited![0])s:\(strSplited![1])"
        return strFormatted
    }
}

// MARK: - Specification
struct Specification: Codable {
    let fundRiskProfile: FundProfile
    
    enum CodingKeys: String, CodingKey {
        case fundRiskProfile = "fund_risk_profile"
    }
}

// MARK: - FundProfile
struct FundProfile: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

