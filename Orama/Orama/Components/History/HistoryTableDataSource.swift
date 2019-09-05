import UIKit

class HistoryTableDataSource: NSObject, UITableViewDataSource {
    
    let history: [String]
    static let identifier = "identifier"
    
    init(history: [String]) {
        self.history = history
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableDataSource.identifier, for: indexPath) as! HistoryTableViewCell
        cell.configure(fund: history[indexPath.row])
        return cell
    }
}
