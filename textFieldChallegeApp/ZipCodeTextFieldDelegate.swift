//
//  ZipCodeTextFieldDelegate.swift
//  textFieldChallegeApp
//
//  Created by Alper on 02/12/15.
//  Copyright © 2015 Alper. All rights reserved.
//

import Foundation
import UIKit

//Zip code field : A text field that allows only digits, and a maximum of five characters.

class ZipCodeTextFieldDelegate: NSObject , UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        var newText : String
        
        newText = textField.text!
        newText = (newText as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        
        return newText.containsOnlyCharactersIn("0123456789") &&
               newText.characters.count <= 5
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}