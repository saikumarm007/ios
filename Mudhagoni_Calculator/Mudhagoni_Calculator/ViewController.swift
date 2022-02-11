//
//  ViewController.swift
//  Mudhagoni_Calculator
//
//  Created by Mudhagoni,Sai Kumar on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UIStackView!
    
    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Divison: UIButton!
    
    @IBOutlet weak var S7: UIButton!
    @IBOutlet weak var E8: UIButton!
    @IBOutlet weak var N9: UIButton!
    @IBOutlet weak var F4: UIButton!
    @IBOutlet weak var F5: UIButton!
    @IBOutlet weak var S6: UIButton!
    @IBOutlet weak var O1: UIButton!
    @IBOutlet weak var T2: UIButton!
    @IBOutlet weak var T3: UIButton!
    @IBOutlet weak var Z0: UIButton!
    @IBOutlet weak var DOT: UIButton!
    @IBOutlet weak var Equal: UIButton!
    @IBOutlet weak var Plus: UIButton!
    @IBOutlet weak var Minus: UIButton!
    @IBOutlet weak var Multiple: UIButton!
    @IBOutlet weak var Remain: UIButton!
    var workings:String = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            clearAll()
            // Do any additional setup after loading the view.
        }
        func clearAll(){
            workings = ""
            DisplayLabel.text = ""
        }
    @IBAction func Equal(_ sender: Any) {
        if(validInput())
                        {
                            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                            let expression = NSExpression(format: checkedWorkingsForPercent)
                            let result = expression.expressionValue(with: nil, context: nil) as! Double
                            let resultString = formatResult(result: result)
                            DisplayLabel.text = resultString
                        }
                        else
                        {
                            let alert = UIAlertController(
                                title: "Invalid Input",
                                message: "Calculator unable to do math based on input",
                                preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .default))
                            self.present(alert, animated: true, completion: nil)
                        }
            }
            func validInput() ->Bool
                {
                    var count = 0
                    var funcCharIndexes = [Int]()
                   
                    for char in workings
                    {
                        if(specialCharacter(char: char))
                        {
                            funcCharIndexes.append(count)
                        }
                        count += 1
                    }
                   
                    var previous: Int = -1
                   
                    for index in funcCharIndexes
                    {
                        if(index == 0)
                        {
                            return false
                        }
                       
                        if(index == workings.count - 1)
                        {
                            return false
                        }
                       
                        if (previous != -1)
                        {
                            if(index - previous == 1)
                            {
                                return false
                            }
                        }
                        previous = index
                    }
                   
                    return true
                }
            func specialCharacter (char: Character) -> Bool
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
               
                func formatResult(result: Double) -> String
                {
                    if(result.truncatingRemainder(dividingBy: 1) == 0)
                    {
                        return String(format: "%.0f", result)
                    }
                    else
                    {
                        return String(format: "%.2f", result)
                    }
    }
    @IBAction func AC(_ sender: Any) {
        clearAll()
    }
    @IBAction func Clear(_ sender: Any) {
        clearAll()
    }
    @IBAction func backb(_ sender: Any) {
        if(!workings.isEmpty)
                        {
                            workings.removeLast()
                            DisplayLabel.text = workings
                        }
            }
            func addToWorkings(value: String){
                workings = workings + value
                DisplayLabel.text = workings
    }
    @IBAction func Division(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func Mutiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func Minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func Dot(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func Plus(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func Remainder(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func Z0(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func O1(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func T2(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func T3(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func F4(_ sender: Any) {
            addToWorkings(value: "4")
    }
    @IBAction func F5(_ sender: Any) {
            addToWorkings(value: "5")
    }
    @IBAction func S6(_ sender: Any) {
            addToWorkings(value: "6")
    }
    @IBAction func S7(_ sender: Any) {
            addToWorkings(value: "7")
    }
    @IBAction func E8(_ sender: Any) {
            addToWorkings(value: "8")
    }
    @IBAction func N9(_ sender: Any) {
            addToWorkings(value: "9")
    }
}

