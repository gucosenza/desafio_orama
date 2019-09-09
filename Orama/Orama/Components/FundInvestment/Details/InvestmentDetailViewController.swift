import UIKit

class InvestmentDetailViewController: UIViewController {
    
    let investment: FundInvestmentModel
    let imageManager = ImageManager()
    let userDefaultsManager = UserDefaultsManager()
    
    private lazy var descriptionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 7
        return view
    }()
    
    private lazy var fullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var thumbnail: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var initialDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = .black
        text.isEditable = false
        text.isSelectable = false
        return text
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.setTitle("Comprar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor.oramaGreen
        return button
    }()
    
    init(investment: FundInvestmentModel) {
        self.investment = investment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        fullName.text = investment.fullName
        if let imagem = investment.strategyVideo?.thumbnailFormatted() {
            thumbnail.image = imageManager.thumbnailImage(thumbnail: imagem)
        } else {
            thumbnail.image = UIImage(named: "no-image-found-360x260.png")
        }
        initialDate.text = investment.formattedInitialDate()
        descriptionText.text = investment.fundManager.fundManagerDescription
    }
    
    @objc func buttonClicked(sender : UIButton){
        userDefaultsManager.saveHistory(simpleName: investment.simpleName)
        showSimpleAlert()
    }
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Compra", message: "Você comprou esse fundo de investimento", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "ok",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension InvestmentDetailViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(descriptionView)
        self.descriptionView.addSubview(fullName)
        self.descriptionView.addSubview(thumbnail)
        self.descriptionView.addSubview(initialDate)
        self.descriptionView.addSubview(descriptionText)
        view.addSubview(buyButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.descriptionView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 15),
            self.descriptionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            self.descriptionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            self.descriptionView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -15),
            
            fullName.topAnchor.constraint(equalTo: self.descriptionView.topAnchor, constant: 10),
            fullName.leadingAnchor.constraint(equalTo: self.descriptionView.leadingAnchor, constant: 10),
            fullName.trailingAnchor.constraint(equalTo: self.descriptionView.trailingAnchor, constant: -10),
            
            thumbnail.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 10),
            thumbnail.leadingAnchor.constraint(equalTo: fullName.leadingAnchor),
            thumbnail.trailingAnchor.constraint(equalTo: fullName.trailingAnchor),
            
            initialDate.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 10),
            initialDate.leadingAnchor.constraint(equalTo: fullName.leadingAnchor),
            initialDate.trailingAnchor.constraint(equalTo: fullName.trailingAnchor),
            
            descriptionText.topAnchor.constraint(equalTo: initialDate.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: fullName.leadingAnchor),
            descriptionText.trailingAnchor.constraint(equalTo: fullName.trailingAnchor),
            descriptionText.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -10),
            
            buyButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: -10),
            buyButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            buyButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    public func setupAdditionalConfiguration() {
        self.title = "Investimento"
        self.view.backgroundColor = UIColor.oramaWhite
    }

}
