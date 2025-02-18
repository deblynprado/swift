//
//  ViewController.swift
//  Average
//
//  Created by Deblyn Prado on 11/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputNametwo: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var inputNameOne: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNametwo.keyboardType = .decimalPad
        inputNameOne.keyboardType = .decimalPad
    }
    
    @IBAction func calcButton(_ sender: Any) {
        
        guard let scoreOne = Double(inputNameOne.text ?? ""),
              let scoreTwo = Double(inputNametwo.text ?? "") else {
            resultLabel.text = "Digite apenas números"
            return
        }
        
        let average = (scoreOne + scoreTwo) / 2
        
        var type: String = "Ocorreu um erro"
        
        if average >= 0 && average <= 4 {
            type = "Reprovado"
        } else if average > 4 && average < 7 {
            type = "Em recuperação"
        } else if average >= 7 && average <= 10 {
            type = "Aprovado"
        }
        
        resultLabel.text = """
                           Sua média é \(average)
                           Status: \(type)
                           """
    }
}



//Which of these lines is valid if we may or may not have an integer value for httpResponse? (Choose 3.)
//Review the code sample to answer the question. What code goes in the blank? temperatureCheck()
//Review the code sample to answer the question. What code goes in the blank? peopleAdmit()
var http = 0
