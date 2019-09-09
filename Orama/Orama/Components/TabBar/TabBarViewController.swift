import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.oramaWhite
        tabBar.barTintColor = UIColor.oramaGreen
        
        let investmentViewController = FundInvestmentsViewController()
        investmentViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let historyViewController = HistoryViewController()
        historyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let viewControllerList = [ investmentViewController, historyViewController ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
