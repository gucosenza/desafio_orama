import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        if #available(iOS 11.0, *) {
            tabBar.barTintColor = UIColor(named: "baseColor")
        } else {
            // Fallback on earlier versions
        }
        
        let investmentViewController = FundInvestmentsViewController()
        investmentViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let historyViewController = HistoryViewController()
        historyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let viewControllerList = [ investmentViewController, historyViewController ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
