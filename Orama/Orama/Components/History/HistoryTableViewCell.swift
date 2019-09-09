import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    private lazy var viewCell: UIView = {
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
    
    private lazy var fundInvestment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 16)
        label.numberOfLines = 3
        label.textColor = UIColor.oramaGreen
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
        NSLayoutConstraint.activate([
            viewCell.heightAnchor.constraint(equalToConstant: 76),
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            fundInvestment.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 0),
            fundInvestment.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: 0),
            fundInvestment.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor)
        ])
        
    }
    
    
}
