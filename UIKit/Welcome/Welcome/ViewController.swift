//
//  ViewController.swift
//  Welcome
//
//  Created by Deblyn Prado on 28/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputName: UITextField!
    
    @IBAction func buttonHello(_ sender: Any) {
        let helloText: String = "Say Hello,"
//        Perguntar ao professor por que "World" não está aparecendo quando nome está vazio.
        textAreaHello.text = "\(helloText) \(inputName.text ?? "World")!"
    }

    
    @IBOutlet var textAreaHello: UITextView!
}

