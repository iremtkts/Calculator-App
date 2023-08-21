
import UIKit

class HeaderCell: UICollectionViewCell {
    
    static let identifier = "HeaderCell"
    
    let label: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .blue
        self.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
         self.label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
         self.label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
         self.label.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
         ])
    }
}
