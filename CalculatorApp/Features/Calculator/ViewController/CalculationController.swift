

import UIKit

enum CurrentNumber {
    case firstNumber
    case secondNumber
}

class CalculationController {
    
    private var arithmeticController = ArithmeticOperationsController()
    
    var updateViews: (()->Void)?
    
    private(set) lazy var calculatorHeaderLabel: String = self.firstNumber ?? "0"
    private(set) var currentNumber: CurrentNumber = .firstNumber
    
    private(set) var firstNumber: String? = nil {
        didSet {
            self.calculatorHeaderLabel = self.firstNumber ?? "0"
            self.updateViews?()
        }
    }

    private(set) var secondNumber: String? = nil {
        didSet {
            self.calculatorHeaderLabel = self.secondNumber ?? "0"
            self.updateViews?()
        }
    }

    
    private(set) var calculatorOperation: CalculatorOperation? = nil
    
    private(set) var previousNumber: String? = nil
    private(set) var previousOperation: CalculatorOperation? = nil
    
    
    private(set) var firstNumberIsDecimal: Bool = false
        private(set) var secondNumberIsDecimal: Bool = false
        
        var eitherNumberIsDecimal: Bool {
            return firstNumberIsDecimal || secondNumberIsDecimal
        }
    
}

extension CalculationController {
    public func didSelectButton(with calculatorButton: CalculatorButtons) {
        switch calculatorButton {
        case .number(let number):
            self.didSelectNumber(with: number)
        case .allClear:
            self.didSelectNumber(with: 2)
        case .plusMinus:
            self.didSelectNumber(with: 4)
        case .percentage:
            self.didSelectNumber(with: 5)
        case .divide:
            self.didSelectNumber(with: 5)
        case .multiply:
            self.didSelectNumber(with: 7)
        case .subtract:
            self.didSelectNumber(with: 777)
        case .add:
            self.didSelectNumber(with: 77)
        case .equal:
           "q"
        case .decimal:
            1
        }
    }
}

extension CalculationController {
    
    private func didSelectNumber(with number: Int) {
        if self.currentNumber == .firstNumber {
            if var firstNumber = self.firstNumber {
                firstNumber.append(number.description)
                self.firstNumber = firstNumber
                self.previousNumber = firstNumber
            } else {
                self.firstNumber = number.description
                self.previousNumber = number.description
            }
        } else {
            if var secondNumber = self.secondNumber {
                secondNumber.append(number.description)
                self.secondNumber = secondNumber
                self.previousNumber = secondNumber
            } else {
                self.secondNumber = number.description
                self.previousNumber = number.description
            }
        }
    }

}

extension CalculationController {


}
