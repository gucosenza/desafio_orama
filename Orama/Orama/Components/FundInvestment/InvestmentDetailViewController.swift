//
//1. full_name
//2. initial_date
//3. strategy_video.thumbnail (se possuir!)
//4. fund_manager.description

import UIKit

class InvestmentDetailViewController: UIViewController {
    
    let investment: FundInvestmentModel
    
    init(investment: FundInvestmentModel) {
        
        self.investment = investment
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension InvestmentDetailViewController: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    public func setupAdditionalConfiguration() {
        self.title = "Investimento"
        self.view.backgroundColor = .white
    }

}
