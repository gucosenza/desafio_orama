import UIKit

class FundInvestmentCollectionViewCell: UICollectionViewCell {
    
    private lazy var descriptionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "searchCollectionViewCellLineLabel"
        return view
    }()
    
    private let stackViewSimpleName: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var simpleName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private let stackViewAplication: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
//        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var minimumInitialApplicationAmount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fundRiskProfileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var minimunAplication: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 1
        label.text = "Aplicação mínima"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup (fundInvestment: FundInvestmentModel){
        simpleName.text = fundInvestment.simpleName
        minimumInitialApplicationAmount.text = fundInvestment.operability.formatedMinimumInitialApplicationAmount()
        fundRiskProfileName.text = fundInvestment.specification.fundRiskProfile.name
    }
}

extension FundInvestmentCollectionViewCell: CodeView{
    func buildViewHierarchy() {
        contentView.addSubview(descriptionView)
        descriptionView.addSubview(stackViewSimpleName)
        stackViewSimpleName.addArrangedSubview(simpleName)
        descriptionView.addSubview(stackViewAplication)
        stackViewAplication.addArrangedSubview(fundRiskProfileName)
        stackViewAplication.addArrangedSubview(minimunAplication)
        stackViewAplication.addArrangedSubview(minimumInitialApplicationAmount)
        
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            descriptionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
            descriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            descriptionView.layer.cornerRadius = 16
            descriptionView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            
            stackViewSimpleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            stackViewSimpleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            stackViewSimpleName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
            stackViewSimpleName.widthAnchor.constraint(equalToConstant: contentView.bounds.width/2).isActive = true
            
            simpleName.trailingAnchor.constraint(equalTo: stackViewSimpleName.trailingAnchor, constant: -10).isActive = true
            simpleName.leadingAnchor.constraint(equalTo: stackViewSimpleName.leadingAnchor, constant: 5).isActive = true
            
            stackViewAplication.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            stackViewAplication.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
            stackViewAplication.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
            stackViewAplication.leadingAnchor.constraint(equalTo: stackViewSimpleName.trailingAnchor, constant: 0).isActive = true
            
            minimunAplication.centerYAnchor.constraint(equalTo: stackViewAplication.centerYAnchor).isActive = true
            minimunAplication.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            minimunAplication.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true
            
            fundRiskProfileName.bottomAnchor.constraint(equalTo: minimunAplication.topAnchor, constant: 5).isActive = true
            minimunAplication.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            minimunAplication.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true
            
            minimumInitialApplicationAmount.topAnchor.constraint(equalTo: minimunAplication.bottomAnchor, constant: 5).isActive = true
            minimunAplication.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            minimunAplication.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func setupAdditionalConfiguration() {
        contentView.backgroundColor = .blue
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.15
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 7
    }
    
}


extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
