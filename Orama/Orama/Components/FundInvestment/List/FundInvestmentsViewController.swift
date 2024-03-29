import UIKit

class FundInvestmentsViewController: UIViewController {
    
    var funds = [FundInvestmentModel]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    let identifier = "identifier"
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fundos"
        
        navigationController!.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController!.navigationBar.barTintColor = UIColor.oramaGreen
        navigationController!.navigationBar.tintColor = UIColor.oramaWhite

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FundInvestmentCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        setupView()
        
        let sv = FundInvestmentsViewController.displaySpinner(onView: view)
        OramaApi.loadInvestment { (fundsInvestment) in
            self.funds = fundsInvestment
            FundInvestmentsViewController.removeSpinner(spinner: sv)
        }
        
        
//        guard let path = Bundle.main.path(forResource: "investimentos", ofType: "json"),
//            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
//            else {return}
//
//        funds = try! JSONDecoder().decode([FundInvestmentModel].self, from: data)
        
    }
}

extension FundInvestmentsViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        } else {
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
                ])
        }
    }
    
    public func setupAdditionalConfiguration() {
        self.view.backgroundColor = .white
    }
}


extension FundInvestmentsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return funds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FundInvestmentCollectionViewCell
        cell.setup(fundInvestment: funds[indexPath.row])
        return cell
    }
}

extension FundInvestmentsViewController: UICollectionViewDelegate{
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let index = collectionView.indexPathsForSelectedItems?.first {
                let detailController = InvestmentDetailViewController(investment: funds[index.row])
                self.navigationController?.pushViewController(detailController, animated: true)
            }
        }
}

extension FundInvestmentsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width-40, height: 150)
    }
    
}


extension FundInvestmentsViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
