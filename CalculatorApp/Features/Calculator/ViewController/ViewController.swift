import UIKit



class ViewController: UIViewController {
    
    private let calculationController: CalculationController
    
    private let calculatorView = CalculatorView()
  

    private let buttons: [CalculatorButtons] = [
        .allClear, .plusMinus, .percentage, .divide,
        .number(7), .number(8), .number(9), .multiply,
        .number(4), .number(5), .number(6), .subtract,
        .number(1), .number(2), .number(3), .add,
        .number(0), .decimal, .equal
    ]
    
    init(_ calculationController: CalculationController = CalculationController()) {
        self.calculationController = calculationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = calculatorView
        calculatorView.collectionView.delegate = self
        calculatorView.collectionView.dataSource = self
        
        
        self.calculationController.updateViews = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.calculatorView.collectionView.reloadData()
            }
        }
        
    }

   
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
                    fatalError("Failed to dequeue HeaderCell in CalculationController")
                }
        header.configure(currentCalcText: calculationController.calculatorHeaderLabel)
                return header
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorCell.identifier, for: indexPath) as! CalculatorCell
        let button = buttons[indexPath.item]
        cell.label.text = button.title
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Button \(buttons[indexPath.item]) pressed!")
        
        let cell = buttons[indexPath.item]
        self.calculationController.didSelectButton(with: cell)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.bounds.width - 3) / 5
        let height: CGFloat = 80
        
        if buttons[indexPath.item] == .equal {
            return CGSize(width: width * 2 + 1, height: height)
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let totalCellHeight = view.frame.size.width
        let totalVerticalCellSpacing = CGFloat(10*4)
        
        let window = view.window?.windowScene?.keyWindow
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        
        let avaliableScreenHeight = view.frame.size.height - topPadding - bottomPadding
        
        
        let headerHeight = avaliableScreenHeight - totalCellHeight - totalVerticalCellSpacing
        
        return CGSize(width: view.frame.size.width, height: headerHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
}

