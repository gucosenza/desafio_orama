
import Foundation

struct FundInvestmentModel: Codable{
    let initialDate: String
    let performanceAudios: [PerformanceAudio]
    let descriptionSEO: String
    let operability: Operability
    let fullName: String
    let fees: Fees
    let id: Int
    let isClosed: Bool
    let simpleName: String
    let targetFund: JSONNull?
    let documents: [Document]
    let specification: Specification
    let isActive: Bool
    let taxClassification: String
    let cnpj: String
    let welcomeDescription: Description
    let performanceVideos: [Video]
    let quotaDate: String?
    let benchmark: Benchmark
    let oramaStandard: Bool
    let slug: String
    let volatility12M: String?
    let strategyVideo: Video?
    let profitabilities: Profitabilities
    let closedToCaptureExplanation: String
    let netPatrimony12M: String?
    let isClosedToCapture: Bool
    let fundManager: FundManager
    
    enum CodingKeys: String, CodingKey {
        case initialDate = "initial_date"
        case performanceAudios = "performance_audios"
        case descriptionSEO = "description_seo"
        case operability
        case fullName = "full_name"
        case fees, id
        case isClosed = "is_closed"
        case simpleName = "simple_name"
        case targetFund = "target_fund"
        case documents, specification
        case isActive = "is_active"
        case taxClassification = "tax_classification"
        case cnpj
        case welcomeDescription = "description"
        case performanceVideos = "performance_videos"
        case quotaDate = "quota_date"
        case benchmark
        case oramaStandard = "orama_standard"
        case slug
        case volatility12M = "volatility_12m"
        case strategyVideo = "strategy_video"
        case profitabilities
        case closedToCaptureExplanation = "closed_to_capture_explanation"
        case netPatrimony12M = "net_patrimony_12m"
        case isClosedToCapture = "is_closed_to_capture"
        case fundManager = "fund_manager"
    }
}

// MARK: - Benchmark
struct Benchmark: Codable {
    let id: Int
    let name: String
}

// MARK: - Document
struct Document: Codable {
    let position: Int
    let documentType: String
    let name: String
    let documentURL: String
    
    enum CodingKeys: String, CodingKey {
        case position
        case documentType = "document_type"
        case name
        case documentURL = "document_url"
    }
}

// MARK: - Fees
struct Fees: Codable {
    let maximumAdministrationFee, anticipatedRetrievalFeeValue, administrationFee, anticipatedRetrievalFee: String
    let performanceFee: String
    let hasAnticipatedRetrieval: Bool
    
    enum CodingKeys: String, CodingKey {
        case maximumAdministrationFee = "maximum_administration_fee"
        case anticipatedRetrievalFeeValue = "anticipated_retrieval_fee_value"
        case administrationFee = "administration_fee"
        case anticipatedRetrievalFee = "anticipated_retrieval_fee"
        case performanceFee = "performance_fee"
        case hasAnticipatedRetrieval = "has_anticipated_retrieval"
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
    
    public func formatedMinimumInitialApplicationAmount() -> String? {
        let value = minimumInitialApplicationAmount
        let myInteger = Double(value)
        
        let price = NSNumber(value: myInteger!)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: price)
    }
}

// MARK: - PerformanceAudio
struct PerformanceAudio: Codable {
    let referenceDate, soundcloudID: String
    let permalinkURL: String
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case referenceDate = "reference_date"
        case soundcloudID = "soundcloud_id"
        case permalinkURL = "permalink_url"
        case id, title
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
}

// MARK: - Profitabilities
struct Profitabilities: Codable {
    let m60, m48, m24, m36: String?
    let month, m12, year, day: String?
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
