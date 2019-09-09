import UIKit

class FundInvestmentCollectionViewCell: UICollectionViewCell {
    
    private lazy var lineView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.oramaGreen
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
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 10),
            //                lineView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner],
            
            stackViewSimpleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackViewSimpleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackViewSimpleName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            stackViewSimpleName.widthAnchor.constraint(equalToConstant: (contentView.bounds.width-10)/2),
            
            simpleName.trailingAnchor.constraint(equalTo: stackViewSimpleName.trailingAnchor, constant: 0),
            simpleName.leadingAnchor.constraint(equalTo: stackViewSimpleName.leadingAnchor, constant: 0),
            simpleName.centerYAnchor.constraint(equalTo: stackViewSimpleName.centerYAnchor),
            
            stackViewAplication.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackViewAplication.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackViewAplication.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            stackViewAplication.widthAnchor.constraint(equalToConstant: (contentView.bounds.width-10)/2),
            
            minimunAplication.centerYAnchor.constraint(equalTo: stackViewAplication.centerYAnchor),
            minimunAplication.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0),
            minimunAplication.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0),
            
            fundRiskProfileName.bottomAnchor.constraint(equalTo: minimunAplication.topAnchor, constant: 0),
            fundRiskProfileName.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0),
            fundRiskProfileName.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0),
            
            minimumInitialApplicationAmount.topAnchor.constraint(equalTo: minimunAplication.bottomAnchor, constant: 0),
            minimumInitialApplicationAmount.leadingAnchor.constraint(equalTo: stackViewAplication.leadingAnchor, constant: 0),
            minimumInitialApplicationAmount.trailingAnchor.constraint(equalTo: stackViewAplication.trailingAnchor, constant: 0)
            ])
        
        if #available(iOS 11.0, *) {
            lineView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            
        } else {
           
        }
    }
    
    public func setupAdditionalConfiguration() {
        contentView.backgroundColor = UIColor.oramaWhite
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.15
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 7
    }
    
}
