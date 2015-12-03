//
//  ViewController.swift
//  textFieldChallegeApp
//
//  Created by Alper on 02/12/15.
//  Copyright © 2015 Alper. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {

    
    //Outlets
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var lockSwitch: UISwitch!
    
    //Textfield Delegate Objects
    
    var zipCodeDelegate = ZipCodeTextFieldDelegate()
    var cashTextfieldDelegate = CashTextFieldDelegate()
    var lockableTextfieldDelegate = LockableTextFieldDelegate()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set the delegate objects
        textField1.delegate = zipCodeDelegate
        textField2.delegate = cashTextfieldDelegate
        textField3.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return lockSwitch.on
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return lockSwitch.on
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func toggleTheTextEditor(sender: UISwitch) {
        
        if (sender.on){
        
            self.textField3.resignFirstResponder()
        }
    }



}

