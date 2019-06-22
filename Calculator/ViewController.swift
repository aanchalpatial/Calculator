//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    var firstOperand : Double?
    var secondOperand : Double?
    var text : String = ""
    var currentOp : String?
    
    override func viewDidLoad() {
        displayLabel.numberOfLines = 1
        displayLabel.minimumScaleFactor = 0.5
        displayLabel.adjustsFontSizeToFitWidth = true

    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        
        
        if firstOperand == nil && displayLabel.text != "0" {
            firstOperand =  Double(displayLabel.text!)
        }else if secondOperand == nil && displayLabel.text != "0"  {
            secondOperand = Double(displayLabel.text!)
        }
        
        text = ""
        
        
        if firstOperand != nil{
            
            if sender.currentTitle == "AC" {
                displayLabel.text = "0"
                firstOperand = nil
                secondOperand = nil
                currentOp = nil
            }else if sender.currentTitle == "+/-"{
                firstOperand = firstOperand! * -1
                displayLabel.text = String(firstOperand!)
                firstOperand = nil
            }else if sender.currentTitle == "%"{
                firstOperand = firstOperand! / 100
                displayLabel.text = String(firstOperand!)
                firstOperand = nil
            }
            
            
            
            if secondOperand != nil {
                if sender.currentTitle == "="{
                    if currentOp == "÷"{
                        firstOperand = firstOperand! / secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "×"{
                        firstOperand = firstOperand! * secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "-"{
                        firstOperand = firstOperand! - secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "+"{
                        firstOperand = firstOperand! + secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }
                    currentOp = nil
                    firstOperand = nil
                    secondOperand = nil
                }else {
                    if currentOp == "÷"{
                        firstOperand = firstOperand! / secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "×"{
                        firstOperand = firstOperand! * secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "-"{
                        firstOperand = firstOperand! - secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }else if currentOp == "+"{
                        firstOperand = firstOperand! + secondOperand!
                        displayLabel.text = String(firstOperand!)
                    }
                    secondOperand = nil
                    currentOp = nil
                }
            }
            
            if sender.currentTitle == "÷" || sender.currentTitle == "×" || sender.currentTitle == "-" || sender.currentTitle == "+" {
                currentOp = sender.currentTitle
                displayLabel.text = "0"
                
            }
            
            
        }
    }
    
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let buttonPressed = sender.currentTitle {
            
            if buttonPressed == "." {
                if text == "" {
                    text = "0"
                }
                if !(floor(Double(text)!) == Double(text)) {
                    return
                }
            }
            text.append(buttonPressed)
            displayLabel.text = text
        }
        
        
    }
    
    
}

