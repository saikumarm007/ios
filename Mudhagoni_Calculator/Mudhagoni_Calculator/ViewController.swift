//
//  ViewController.swift
//  Mudhagoni_Calculator
//
//  Created by Mudhagoni,Sai Kumar on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dlabel: UILabel!
    
    @IBOutlet weak var ACLabel: UIButton!
    @IBOutlet weak var CLabel: UIButton!
    @IBOutlet weak var backLabel: UIButton!
    
    @IBOutlet weak var divisonLabel: UIButton!
    @IBOutlet weak var s7: UIButton!
    @IBOutlet weak var s8: UIButton!
    @IBOutlet weak var s9: UIButton!
    @IBOutlet weak var mulLabel: UIButton!
    @IBOutlet weak var f4: UIButton!
    @IBOutlet weak var f5: UIButton!
    @IBOutlet weak var s6: UIButton!
    @IBOutlet weak var subLabel: UIButton!
    @IBOutlet weak var o1: UIButton!
    @IBOutlet weak var t2: UIButton!
    @IBOutlet weak var t3: UIButton!
    @IBOutlet weak var addLabel: UIButton!
    @IBOutlet weak var z0: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var remainder: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    var workings:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            dlabel.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func clearAll()
    {
        workings = ""
        dlabel.text = ""
    }

    @IBAction func clearButtonClicked(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func clrButtonClicked(_ sender: Any) {
        clearAll()
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            dlabel.text = workings
        }
    }
    func addToWorkings(value: String){
        workings = workings + value
        dlabel.text = workings
    }
    @IBAction func divisionButtonClicked(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func s7ButtonClicked(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func s8ButtonClicked(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func s9ButtonClicked(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func subButtonClicked(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func mulButtonClicked(_ sender: Any) {
        addToWorkings(value: "*")
        
    }
    @IBAction func f4ButtonClicked(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func f5ButtonClicked(_ sender: Any) {
            addToWorkings(value: "5")
    }
    @IBAction func s6ButtonClicked(_ sender: Any) {
            addToWorkings(value: "6")
    }
    @IBAction func o1ButtonClicked(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func t2ButtonClicked(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func t3ButtonClicked(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func addButtonClicked(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func z0ButtonClicked(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func dotButtonClicked(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func remButtonClicked(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func equalButtonClicked(_ sender: Any) {
        addToWorkings(value: "=")
        
    }
    

    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexed = [Int]()
        for char in workings
        {
            if(specialCharcter(char: char))
            {
                funcCharIndexed.append(count)
            }
            count += 1
            }
        var previous: Int = -1
        
        for index in funcCharIndexed
        {
            if(index == 0)
            {
                return false
            }
            if(index == workings.count - 1)
            {
                return false
            }
            if(previous != -1)
            {
                return false
            }
        previous = index
        }
    return true
    }
func specialCharcter (char: Character) -> Bool
{
    if(char == "*")
    {
        return true
    }
    if(char == "/")
    {
        return true
    }
    if(char == "+")
    {
        return true
    }
    return false
}
func formatResult(result: Double) -> String{
    if(result.truncatingRemainder(dividingBy: 1) == 0)
    {
        return String(format: "%.0f" , result)
    }
    else
    {
        return String(format: "%.2f", result)
    }
}

    


}
