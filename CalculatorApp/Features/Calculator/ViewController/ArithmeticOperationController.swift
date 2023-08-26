

import Foundation

class ArithmeticOperationsController {
    
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

}


extension ArithmeticOperationsController {
    
    
    func didArithmeticOperationPressed(_ operation: CalculatorOperation, _ firstNumber: Double?, _ secondNumber: Double?) -> Double {
        guard let firstNumber = firstNumber, let secondNumber = secondNumber else {return 0}
        
        switch operation {
        case .divide:
            return (firstNumber / secondNumber)
        case .multiply:
            return (firstNumber * secondNumber)
        case .subtract:
            return (firstNumber - secondNumber)
        case .add:
            return (firstNumber + secondNumber)
        }
    }
    
    func didPressedPlusMinusButton() {
        if currentNumber == .firstNumber, var number = firstNumber {
            if number.contains("-") {
                number.removeFirst()
            } else {
                number.insert("-", at: number.startIndex)
            }
            
            firstNumber = number
            previousNumber = number
            
        } else if currentNumber == .secondNumber, var number = secondNumber {
            if number.contains("-") {
                number.removeFirst()
            } else {
                number.insert("-", at: number.startIndex)
            }
            
            secondNumber = number
            previousNumber = number
        }
    }
    
    
    func didPressedPercentageButton() {
        
    }
}
