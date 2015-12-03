//
//  CashTextFieldDelegate.swift
//  textFieldChallegeApp
//
//  Created by Alper on 02/12/15.
//  Copyright © 2015 Alper. All rights reserved.
//

import Foundation
import UIKit


class CashTextFieldDelegate: NSObject , UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
    
        
        let oldText = textField.text! as NSString
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        
        // Format the new string
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false

    
    }
    
    func dollarStringFromInt(value: Int) -> String {
        return String(value / 100)
    }
    
    func centsStringFromInt(value: Int) -> String {
        
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        
        textField.text = ("$\(textField.text!)")
    }
    
   

    
}