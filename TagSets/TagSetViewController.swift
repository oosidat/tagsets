//
//  TagSetViewController.swift
//  TagSets
//
//  Created by Osama Sidat on 12/7/15.
//  Copyright © 2015 Osama Sidat. All rights reserved.
//

import UIKit

class TagSetViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    @IBOutlet weak var tagsetTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var tagSet: TagSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle text field's user input through delegate callbacks
        tagsetTextField.delegate = self
        
        if let tagSet = tagSet {
            navigationItem.title = tagSet.name
            tagsetTextField.text = tagSet.name
        }
        
        checkValidTagSetName()
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidTagSetName() {
        let text = tagsetTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidTagSetName()
        navigationItem.title = textField.text
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddTagSetMode = presentingViewController is UINavigationController
        
        if isPresentingInAddTagSetMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = tagsetTextField.text ?? ""
            
            tagSet = TagSet(name: name)
            
        }
    }
}

