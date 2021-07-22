//
//  FUIFunctions.swift
//  fuikit
//
//  Created by Calvin Collins on 7/21/21.
//

import UIKit

public func addSubview(_ adder: UIView, subview: UIView) {
    adder.addSubview(subview)
}

public func addSublayer(_ adder: CALayer, sublayer: CALayer) {
    adder.addSublayer(sublayer)
}

public func setMask(layer: CALayer, mask: CALayer) {
    layer.mask = mask
}

public func addGestureRecognizer(_ gesture: UIGestureRecognizer) -> (UIView) -> Void {
    return { view in
        view.addGestureRecognizer(gesture)
    }
}

public func addTarget(target: Any?, selector: Selector, event: UIControl.Event) -> (UIControl) -> Void {
    return { control in
        control.addTarget(target, action: selector, for: event)
    }
}

public func convert(view1: UIView, to view2: UIView) -> CGRect {
    return view1.convert(view1.bounds, to: view2)
}

public func convert(vc: UIViewController, to view: UIView) -> CGRect {
    return vc.view.convert(vc.view.bounds, to: view)
}

public func gradientLayer(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) -> CAGradientLayer {
    let layer = CAGradientLayer()
    layer.colors = colors.map(\.cgColor)
    layer.startPoint = startPoint
    layer.endPoint = endPoint
    return layer
}

public func withPadding(_ rect: CGRect, padding: CGFloat) -> CGRect {
    return rect.insetBy(dx: -padding, dy: -padding)
}

public func shiftRight(rect: CGRect, by shift: CGFloat) -> CGRect {
    return CGRect(x: rect.minX + shift, y: rect.minY, width: rect.width, height: rect.height)
}

public func shiftLeft(rect: CGRect, by shift: CGFloat) -> CGRect {
    return CGRect(x: rect.minX - shift, y: rect.minY, width: rect.width, height: rect.height)
}

public func shiftUp(rect: CGRect, by shift: CGFloat) -> CGRect {
    return CGRect(x: rect.minX, y: rect.minY - shift, width: rect.width, height: rect.height)
}

public func shiftDown(rect: CGRect, by shift: CGFloat) -> CGRect {
    return CGRect(x: rect.minX, y: rect.minY + shift, width: rect.width, height: rect.height)
}

public func shiftViewRight(by shift: CGFloat) -> (UIView) -> Void {
    return { view in
        view.frame = CGRect(x: view.frame.minX + shift, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
    }
}

public func shiftViewLeft(by shift: CGFloat) -> (UIView) -> Void {
    return { view in
        view.frame = CGRect(x: view.frame.minX - shift, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
    }
}

public func shiftViewUp(by shift: CGFloat) -> (UIView) -> Void {
    return { view in
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY - shift, width: view.frame.width, height: view.frame.height)
    }
}

public func shiftViewDown(by shift: CGFloat) -> (UIView) -> Void {
    return { view in
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY + shift, width: view.frame.width, height: view.frame.height)
    }
}

public func combineTwoRects(leftRect: CGRect, rightRect: CGRect) -> CGRect {
    return CGRect(x: leftRect.minX, y: min(leftRect.minY, rightRect.minY), width: rightRect.maxX - leftRect.minX, height: max(leftRect.maxY, rightRect.maxY) - min(leftRect.minY, rightRect.minY))
}

public func combineRects(rects: CGRect...) -> CGRect {
    let sortedRects = rects.sorted(by: { $0.minX < $1.minX })
    return sortedRects.reduce(sortedRects[0], combineTwoRects)
}
