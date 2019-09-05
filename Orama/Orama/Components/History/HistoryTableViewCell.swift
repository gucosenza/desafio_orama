import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    private lazy var viewCell: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fundInvestment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 16)
        label.numberOfLines = 3
        return label
    }()
    
    func configure(fund: String) {
        fundInvestment.text = fund
        setupView()
    }
    
}


extension HistoryTableViewCell: CodeView {
    func buildViewHierarchy() {
        self.addSubview(viewCell)
        viewCell.addSubview(fundInvestment)
    }
    
    func setupConstraints() {
        if #available(iOS 11.0, *) {
            viewCell.layer.cornerRadius = 16
            viewCell.layer.shadowColor = UIColor.black.cgColor
            viewCell.layer.shadowOpacity = 0.15
            viewCell.layer.shadowOffset = .zero
            viewCell.layer.shadowRadius = 7
            viewCell.heightAnchor.constraint(equalToConstant: 76).isActive = true
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
            
            fundInvestment.textColor = UIColor(named: "baseColor")
            fundInvestment.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 0).isActive = true
            fundInvestment.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: 0).isActive = true
            fundInvestment.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor).isActive = true
    
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}
