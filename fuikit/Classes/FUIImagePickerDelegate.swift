//
//  FUIImagePickerDelegate.swift
//  fuikit
//
//  Created by Calvin Collins on 3/16/21.
//

import Foundation
import UIKit

open class FUIImagePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    open var onPickerDidCancel: ((UIImagePickerController) -> Void)?
    open var onPickerDidPick: ((UIImagePickerController, [UIImagePickerController.InfoKey : Any]) -> Void)?
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        onPickerDidCancel?(picker)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        onPickerDidPick?(picker, info)
    }
}
