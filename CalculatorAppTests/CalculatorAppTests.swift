

import XCTest
@testable import CalculatorApp

final class CalculatorAppTests: XCTestCase {
    
    var aritmeticController:ArithmeticOperationsController!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        aritmeticController = ArithmeticOperationsController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        aritmeticController = nil
        super.tearDown()
    }

    func testDidArithmeticOperationPressedForAddition() {
        let result = aritmeticController.didArithmeticOperationPressed(.add, 3, 4)
        XCTAssertEqual(result, 7)
    }
    
    func testDidArithmeticOperationPressedForSubtraction() {
        let result = aritmeticController.didArithmeticOperationPressed(.subtract, 7, 5)
        XCTAssertEqual(result, 2)
    }
    
    func testDidArithmeticOperationPressedForMultiplication() {
        let result = aritmeticController.didArithmeticOperationPressed(.multiply, 4, 2)
        XCTAssertEqual(result, 8)
    }
    
    func testDidArithmeticOperationPressedForDivision() {
        let result = aritmeticController.didArithmeticOperationPressed(.divide, 25, 5)
        XCTAssertEqual(result, 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
