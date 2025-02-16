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
    
    @IBAction func calcButton(_ sender: Any) {
        
        guard let scoreOne = Double(inputNameOne.text ?? "0"),
              let scoreTwo = Double(inputNametwo.text ?? "0") else {
            resultLabel.text = "Digite apenas números"
            return
        }
        
        let average = (scoreOne + scoreTwo) / 2
        
        if average >= 0 && average <= 5 {
            resultLabel.text = "Média \(average) - Reprovado"
        } else if average > 5 && average < 7 {
            resultLabel.text = "Média \(average) - Em Recuperação"
        } else {
            resultLabel.text = "Média \(average) - Aprovado"
        }
    }
}
