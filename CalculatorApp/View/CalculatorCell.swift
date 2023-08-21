
import UIKit

class CalculatorCell: UICollectionViewCell {
    
    static let identifier = "ButtonCell"

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
    
    func setupUI () {
        addSubview(label)
        backgroundColor = .purple
        
        let extraSpace = self.frame.width - self.frame.height
        
        NSLayoutConstraint.activate([
         heightAnchor.constraint(equalToConstant: self.frame.height),
         widthAnchor.constraint(equalToConstant: self.frame.height),
         centerYAnchor.constraint(equalTo: self.centerYAnchor),
         leadingAnchor.constraint(equalTo: self.leadingAnchor),
         trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -extraSpace), ])
    }
}
