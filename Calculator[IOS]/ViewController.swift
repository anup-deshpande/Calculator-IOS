//
//  ViewController.swift
//  Calculator[IOS]
//
//  Created by Deshpande, Anup on 5/21/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var operations: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonClicked(_ sender: UIButton) {
        if let sender = sender.title(for: UIControl.State.normal){
            if sender == "Clear All"{
                firstNumber.text = ""
                secondNumber.text = ""
                resultLabel.text = "Result: 0.00"
            }
            
            if sender == "Perform Operation"{
                let isValid = validateInputs()
                if (isValid){
                    
                    let num1 = Double(firstNumber.text!)
                    let num2 = Double(secondNumber.text!)
                    
                    
                    switch operations.selectedSegmentIndex{
                    case 0:
                        resultLabel.text = "Result: \(num1! + num2!)"
                    case 1:
                        resultLabel.text = "Result: \(num1! - num2!)"
                    case 2:
                        resultLabel.text = "Result: \(num1! * num2!)"
                    case 3:
                        if num2 != 0{
                            resultLabel.text = "Result: \(num1! / num2!)"
                        }else{
                            let alert = UIAlertController(title: "Warning", message: "Divide by zero produces Infinity", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                            alert.addAction(action)
                            present(alert,animated: true,completion: nil)
                        }
                    default:
                        print("Default statement")
                    }
                }
            }
        }
    }
    
    
    func validateInputs() -> Bool{
        
       if(firstNumber.text == "" && secondNumber.text == ""){
        
        let alert = UIAlertController(title: "Warning", message: "Please enter numbers", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        return false
        
        }
       else if(firstNumber.text != "" && secondNumber.text == ""){
            let alert = UIAlertController(title: "Warning", message: "Please Enter Second Number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
            return false
        }
       else if(firstNumber.text == "" && secondNumber.text != ""){
        
        
        let alert = UIAlertController(title: "Warning", message: "Please Enter First Number", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        return false
        }
        return true
    }
}

