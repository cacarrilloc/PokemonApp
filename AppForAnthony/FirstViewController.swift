//
//  ViewController.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        myLabel.layer.cornerRadius = 10.0
        myLabel.clipsToBounds = true
        myButton.layer.cornerRadius = 15
        myTextField.layer.cornerRadius = 15
    }
    
    @IBAction func inputButton(sender: UIButton){
        guard let text = myTextField.text else {return}
        guard let userInput = Int(text) else {return}
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        myVC.passedIndex = userInput
        navigationController?.pushViewController(myVC, animated: true)
        print("@IBAction")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FirstViewController:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}







