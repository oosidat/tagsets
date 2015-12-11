//
//  ViewController.swift
//  TagSets
//
//  Created by Osama Sidat on 12/7/15.
//  Copyright © 2015 Osama Sidat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var tagsetLabelName: UILabel!
    @IBOutlet weak var tagsetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle text field's user input through delegate callbacks
        tagsetTextField.delegate = self
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        tagsetLabelName.text = textField.text
    }
    
    
    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        tagsetLabelName.text = "Default"
    }
}

