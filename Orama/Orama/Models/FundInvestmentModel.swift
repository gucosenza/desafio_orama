
//2.operability.minimum_initial_application_amount
//3.specification.fund_risk_profile.name
//3.strategy_video.thumbnail (se possuir!)
//4.fund_manager.description

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
    let id: Int
    let fullName, logo, slug, name: String
    
    enum CodingKeys: String, CodingKey {
        case fundManagerDescription = "description"
        case id
        case fullName = "full_name"
        case logo, slug, name
    }
}

// MARK: - Operability
struct Operability: Codable {
    let hasOperationsOnThursdays: Bool
    let retrievalLiquidationDaysType, applicationQuotationDaysType: String
    let retrievalQuotationDays: Int
    let anticipatedRetrievalQuotationDaysStr: String
    let retrievalQuotationDaysType: String
    let anticipatedRetrievalQuotationDays: Int
    let hasOperationsOnWednesdays: Bool
    let minimumBalancePermanence: String
    let hasOperationsOnTuesdays: Bool
    let minimumInitialApplicationAmount: String
    let applicationTimeLimit: String
    let hasOperationsOnMondays: Bool
    let retrievalTimeLimit: String
    let hasOperationsOnFridays: Bool
    let retrievalSpecialType, applicationQuotationDaysStr, retrievalQuotationDaysStr: String
    let retrievalLiquidationDaysStr: String
    let minimumSubsequentRetrievalAmount: String
    let retrievalLiquidationDays, applicationQuotationDays: Int
    let anticipatedRetrievalQuotationDaysType: String
    let maximumInitialApplicationAmount, minimumSubsequentApplicationAmount: String
    
    enum CodingKeys: String, CodingKey {
        case hasOperationsOnThursdays = "has_operations_on_thursdays"
        case retrievalLiquidationDaysType = "retrieval_liquidation_days_type"
        case applicationQuotationDaysType = "application_quotation_days_type"
        case retrievalQuotationDays = "retrieval_quotation_days"
        case anticipatedRetrievalQuotationDaysStr = "anticipated_retrieval_quotation_days_str"
        case retrievalQuotationDaysType = "retrieval_quotation_days_type"
        case anticipatedRetrievalQuotationDays = "anticipated_retrieval_quotation_days"
        case hasOperationsOnWednesdays = "has_operations_on_wednesdays"
        case minimumBalancePermanence = "minimum_balance_permanence"
        case hasOperationsOnTuesdays = "has_operations_on_tuesdays"
        case minimumInitialApplicationAmount = "minimum_initial_application_amount"
        case applicationTimeLimit = "application_time_limit"
        case hasOperationsOnMondays = "has_operations_on_mondays"
        case retrievalTimeLimit = "retrieval_time_limit"
        case hasOperationsOnFridays = "has_operations_on_fridays"
        case retrievalSpecialType = "retrieval_special_type"
        case applicationQuotationDaysStr = "application_quotation_days_str"
        case retrievalQuotationDaysStr = "retrieval_quotation_days_str"
        case retrievalLiquidationDaysStr = "retrieval_liquidation_days_str"
        case minimumSubsequentRetrievalAmount = "minimum_subsequent_retrieval_amount"
        case retrievalLiquidationDays = "retrieval_liquidation_days"
        case applicationQuotationDays = "application_quotation_days"
        case anticipatedRetrievalQuotationDaysType = "anticipated_retrieval_quotation_days_type"
        case maximumInitialApplicationAmount = "maximum_initial_application_amount"
        case minimumSubsequentApplicationAmount = "minimum_subsequent_application_amount"
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
    let videoDescription, title: String
    let url: String
    let published: String?
    let id: Int
    let enabledForTvorama: Bool
    let youtubeID: String
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case videoDescription = "description"
        case title, url, published, id
        case enabledForTvorama = "enabled_for_tvorama"
        case youtubeID = "youtube_id"
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
    let fundSuitabilityProfile, fundRiskProfile: FundProfile
    let isQualified: Bool
    let fundType: String
    let fundClass: String
    let fundMacroStrategy, fundMainStrategy: FundMaStrategy
    
    enum CodingKeys: String, CodingKey {
        case fundSuitabilityProfile = "fund_suitability_profile"
        case fundRiskProfile = "fund_risk_profile"
        case isQualified = "is_qualified"
        case fundType = "fund_type"
        case fundClass = "fund_class"
        case fundMacroStrategy = "fund_macro_strategy"
        case fundMainStrategy = "fund_main_strategy"
    }
}

// MARK: - FundMaStrategy
struct FundMaStrategy: Codable {
    let explanation: String
    let id: Int
    let name: String
    let fundMacroStrategy: Int?
    
    enum CodingKeys: String, CodingKey {
        case explanation, id, name
        case fundMacroStrategy = "fund_macro_strategy"
    }
}

// MARK: - FundProfile
struct FundProfile: Codable {
    let scoreRangeOrder: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case scoreRangeOrder = "score_range_order"
        case name
    }
}

// MARK: - Description
struct Description: Codable {
    let objective: String
    let movieURL: String?
    let targetAudience, strengths, strategy: String
    
    enum CodingKeys: String, CodingKey {
        case objective
        case movieURL = "movie_url"
        case targetAudience = "target_audience"
        case strengths, strategy
    }
}
