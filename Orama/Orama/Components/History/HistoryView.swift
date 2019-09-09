import UIKit

class HistoryView: UIView {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.allowsSelection = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryView: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                tableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                tableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: topAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
                ])
        }
    }
}
