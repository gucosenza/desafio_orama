import UIKit

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()
    var historyList: [String] = []
    var historyTableDataSource: HistoryTableDataSource?
    let userDefaultsManager = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Histórico de compras"
        
        navigationController!.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        if #available(iOS 11.0, *) {
            navigationController!.navigationBar.barTintColor = UIColor(named: "baseColor")
            navigationController!.navigationBar.tintColor = .white
        } else {
            // Fallback on earlier versions
        }
        
        historyView.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableDataSource.identifier)
        loadHistory()
    }
    
    override func loadView() {
        self.view = historyView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadHistory()
    }
    
    private func loadHistory() {
        historyList = userDefaultsManager.getHistory()
        historyTableDataSource = HistoryTableDataSource(history: historyList)
        historyView.tableView.dataSource = historyTableDataSource
    }
}
