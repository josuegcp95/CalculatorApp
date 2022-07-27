

import UIKit

class MainViewController: UIViewController {
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
    //MARK: - Equals Button Tapped
    @IBAction func equalsTapped(_ sender: Any) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
    }
    //MARK: - Back Tapped
    @IBAction func backTapped(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    //MARK: - Clear Tapped
    @IBAction func clearTapped(_ sender: Any) {
        clearAll()
    }
    //MARK: - Divide Tapped
    @IBAction func divideTapped(_ sender: Any) {
        addToWorkings(value: "/")
    }
    //MARK: - Multiply Tapped
    @IBAction func multiplyTapped(_ sender: Any) {
        addToWorkings(value: "*")
    }
    //MARK: - Plain Button Tapped
    @IBAction func plainButtonTapped(_ sender: UIButton) {
        if let value = sender.titleLabel?.text {
            addToWorkings(value: value)
        }
    }
}





