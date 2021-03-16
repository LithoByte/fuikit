//
//  FUIImagePickerDelegate.swift
//  fuikit
//
//  Created by Calvin Collins on 3/16/21.
//

import Foundation
import UIKit

public class FUIImagePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    open var onPickerDidCancel: ((UIImagePickerController) -> Void) = dismiss
    open var onPickerDidPick: ((UIImagePickerController, [UIImagePickerController.InfoKey : Any]) -> Void)?
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        onPickerDidCancel(picker)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        onPickerDidPick?(picker, info)
    }
}

public func dismiss(vc: UIViewController) -> Void {
    vc.dismiss(animated: true, completion: nil)
}
