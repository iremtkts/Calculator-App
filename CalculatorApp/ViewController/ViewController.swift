import UIKit

class ViewController: UIViewController {

    private let calculatorView = CalculatorView()
  

    private let buttons: [CalculatorButtons] = [
        .allClear, .plusMinus, .percentage, .divide,
        .number(7), .number(8), .number(9), .multiply,
        .number(4), .number(5), .number(6), .subtract,
        .number(1), .number(2), .number(3), .add,
        .number(0), .decimal, .equal
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view = calculatorView
        calculatorView.collectionView.delegate = self
        calculatorView.collectionView.dataSource = self
        
        
    }

   
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalculatorCell
        let button = buttons[indexPath.item]
        cell.label.text = button.title
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Button \(buttons[indexPath.item]) pressed!")
        // hesaplamalar
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.bounds.width - 3) / 4
        return CGSize(width: width, height: 80)
    }
}

