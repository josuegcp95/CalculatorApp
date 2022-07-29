

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        calculatorResults.layer.cornerRadius = 5.0
        calculatorResults.clipsToBounds = true
        clearAll()
    }
    //MARK: - ClearAll
    func clearAll ( ) {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    //MARK: - AddToWorkings
    func addToWorkings (value: String) {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    //MARK: - FormartResult
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.1f", result)
        }
    }
    //MARK: - EqualsTapped
    @IBAction func equalsTapped(_ sender: Any) {
        if !workings.isEmpty{
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        } else {
            let alertController = UIAlertController(title: "Please enter numbers to calculate", message: "Press OK to Continue", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    //MARK: - BackTapped
    @IBAction func backTapped(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    //MARK: - ClearTapped
    @IBAction func clearTapped(_ sender: Any) {
        clearAll()
    }
    //MARK: - DivideTapped
    @IBAction func divideTapped(_ sender: Any) {
        addToWorkings(value: "/")
    }
    //MARK: - MultiplyTapped
    @IBAction func multiplyTapped(_ sender: Any) {
        addToWorkings(value: "*")
    }
    //MARK: - PlainButtonTapped
    @IBAction func plainButtonTapped(_ sender: UIButton) {
        if let value = sender.titleLabel?.text {
            addToWorkings(value: value)
        }
    }
}
//MARK: - TestMethods
extension CalculatorViewController {
    func addToWorkingsTestMethod (value: String) {
        workings = workings + value
    }
    func clearAllTestMethod ( ) {
        workings = ""
    }
}



