

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {
    
    // sut: System Under Test
    var sut: CalculatorViewController!

    //MARK: Tests Setup
    override func setUpWithError() throws {
        sut = CalculatorViewController()
    }

    //MARK: Tests Teardown
    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: Workings Test
    func testWorkings_IsInitiallyEmpty() {
        XCTAssert(sut.workings.isEmpty)
    }
    
    //MARK:  FormartResult Test
    func testFormatResult_CovertDoubleToString() {
       let result = sut.formatResult(result: 23.0)
        XCTAssertTrue(result == "23")
    }
    
    //MARK: ClearAll Test
    func testClearAll_ClearWorkings() {
        sut.addToWorkingsTestMethod(value: "33")
        sut.addToWorkingsTestMethod(value: "*")
        sut.addToWorkingsTestMethod(value: "3")
        
        sut.clearAllTestMethod()
        XCTAssert(sut.workings.isEmpty)
    }
    
    //MARK: Addition Test
    func testAddition() {
        sut.addToWorkingsTestMethod(value: "15")
        sut.addToWorkingsTestMethod(value: "+")
        sut.addToWorkingsTestMethod(value: "10")
        
        let expression = NSExpression(format: sut.workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        XCTAssert(result == 25)
    }
    
    //MARK: Subtraction Test
    func testSubtraction() {
        sut.addToWorkingsTestMethod(value: "35")
        sut.addToWorkingsTestMethod(value: "-")
        sut.addToWorkingsTestMethod(value: "13")
        
        let expression = NSExpression(format: sut.workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        XCTAssert(result == 22)
    }
    
    //MARK: Multiplication Test
    func testMultiplication() {
        sut.addToWorkingsTestMethod(value: "20")
        sut.addToWorkingsTestMethod(value: "*")
        sut.addToWorkingsTestMethod(value: "7")
        
        let expression = NSExpression(format: sut.workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        XCTAssert(result == 140)
    }
    
    //MARK: Division Test
    func testDivision() {
        sut.addToWorkingsTestMethod(value: "788.0")
        sut.addToWorkingsTestMethod(value: "/")
        sut.addToWorkingsTestMethod(value: "5")
        
        let expression = NSExpression(format: sut.workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        XCTAssert(result == 157.6)
    }
    
    func testRemainder() {
        sut.addToWorkingsTestMethod(value: "9")
        sut.addToWorkingsTestMethod(value: "/")
        sut.addToWorkingsTestMethod(value: "4")
        let remainder = remainder(9.0, 4.0)
        
        let expression = NSExpression(format: sut.workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        XCTAssert(result == 2)
        XCTAssert(remainder == 1)
    }
}
