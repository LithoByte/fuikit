//
//  FUITextFieldDelegate.swift
//  fuikit
//
//  Created by Elliot Schrock on 6/19/20.
//

import UIKit

@available(iOS 10.0, *)
class FUITextFieldDelegate: NSObject, UITextFieldDelegate {
    var onTextFieldShouldBeginEditing: ((UITextField) -> Bool)?
    var onTextFieldDidBeginEditing: ((UITextField) -> Void)?
    var onTextFieldShouldEndEditing: ((UITextField) -> Bool)?
    var onTextFieldDidEndEditing: ((UITextField) -> Void)?
    var onTextFieldDidEndEditingWithReason: ((UITextField, UITextField.DidEndEditingReason) -> Void)?
    var onTextFieldShouldChange: ((UITextField, NSRange, String) -> Bool)?
    var onTextFieldDidChangeSelection: ((UITextField) -> Void)?
    var onTextFieldShouldClear: ((UITextField) -> Bool)?
    var onTextFieldShouldReturn: ((UITextField) -> Bool)?
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return onTextFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        onTextFieldDidBeginEditing?(textField)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return onTextFieldShouldEndEditing?(textField) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onTextFieldDidEndEditing?(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        onTextFieldDidEndEditingWithReason?(textField, reason)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return onTextFieldShouldChange?(textField, range, string) ?? true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        onTextFieldDidChangeSelection?(textField)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return onTextFieldShouldClear?(textField) ?? true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return onTextFieldShouldReturn?(textField) ?? true
    }
}
