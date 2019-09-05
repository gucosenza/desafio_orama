import UIKit

class FundInvestmentCollectionViewCell: UICollectionViewCell {
    
    private lazy var lineView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackViewSimpleName: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
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
        minimumInitialApplicationAmount.text = fundInvestment.operability.formattedMinimumInitialApplicationAmount()
        fundRiskProfileName.text = fundInvestment.specification.fundRiskProfile.name
    }
}

extension FundInvestmentCollectionViewCell: CodeView{
    func buildViewHierarchy() {
        contentView.addSubview(stackViewSimpleName)
        stackViewSimpleName.addArrangedSubview(simpleName)
        contentView.addSubview(stackViewAplication)
        stackViewAplication.addArrangedSubview(fundRiskProfileName)
        stackViewAplication.addArrangedSubview(minimunAplication)
        stackViewAplication.addArrangedSubview(minimumInitialApplicationAmount)
        contentView.addSubview(lineView)
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            lineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: 10).isActive = true
            lineView.layer.cornerRadius = 10
            lineView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            lineView.backgroundColor = UIColor(named: "baseColor")
            
            stackViewSimpleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            stackViewSimpleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
            stackViewSimpleName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
            stackViewSimpleName.widthAnchor.constraint(equalToConstant: (contentView.bounds.width-10)/2).isActive = true
            
            simpleName.trailingAnchor.constraint(equalTo: stackViewSimpleName.trailingAnchor, constant: 0).isActive = true
            simpleName.leadingAnchor.constraint(equalTo: stackViewSimpleName.leadingAnchor, constant: 0).isActive = true
            simpleName.centerYAnchor.constraint(equalTo: stackViewSimpleName.centerYAnchor).isActive = true
            
            stackViewAplication.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            stackViewAplication.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
            stackViewAplication.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
            stackViewAplication.widthAnchor.constraint(equalToConstant: (contentView.bounds.width-10)/2).isActive = true

            minimunAplication.centerYAnchor.constraint(equalTo: stackViewAplication.centerYAnchor).isActive = true
            minimunAplication.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            minimunAplication.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true

            fundRiskProfileName.bottomAnchor.constraint(equalTo: minimunAplication.topAnchor, constant: 0).isActive = true
            fundRiskProfileName.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            fundRiskProfileName.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true

            minimumInitialApplicationAmount.topAnchor.constraint(equalTo: minimunAplication.bottomAnchor, constant: 0).isActive = true
            minimumInitialApplicationAmount.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0).isActive = true
            minimumInitialApplicationAmount.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.15
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 7
    }
    
}
