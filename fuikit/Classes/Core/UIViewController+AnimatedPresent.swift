//
//  UIViewController+AnimatedPresent.swift
//  fuikit
//
//  Created by Calvin Collins on 10/18/21.
//

import Foundation
import LithoOperators

public extension UIViewController {
    func animateTopDown(duration: Double = 1.0) -> (UIView) -> Void {
        return { [weak self] view in
            let size = view.frame.size
            let center = self?.view.center ?? CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            view.frame = CGRect(x: view.frame.minX, y: -1 * size.height, width: size.width, height: size.height)
            let dy = center.y - view.center.y
            self?.view.addSubview(view)
            DispatchQueue.main.async {
                UIView.animate(withDuration: duration, animations: view *> shiftViewDown(by: dy))
            }
        }
    }
    
    func animateBottomUp(duration: Double = 1.0) -> (UIView) -> Void {
        return { [weak self] view in
            let size = view.frame.size
            let center = self?.view.center ?? CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            view.frame = CGRect(x: view.frame.minX, y: UIScreen.main.bounds.height, width: size.width, height: size.height)
            let dy = view.center.y - center.y
            self?.view.addSubview(view)
            DispatchQueue.main.async {
                UIView.animate(withDuration: duration, animations: view *> shiftViewUp(by: dy))
            }
        }
    }
}
