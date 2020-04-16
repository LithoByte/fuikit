//
//  FunctionalViewController.swift
//  fuikit
//
//  Created by Elliot Schrock on 10/31/19.
//

import UIKit

open class FunctionalViewController: UIViewController {
    public var onLoadView: ((FunctionalViewController) -> Void)?
    public var onViewDidLoad: ((FunctionalViewController) -> Void)?
    public var onViewWillAppear: ((FunctionalViewController, Bool) -> Void)?
    public var onViewDidAppear: ((FunctionalViewController, Bool) -> Void)?
    public var onViewWillDisappear: ((FunctionalViewController, Bool) -> Void)?
    public var onViewDidDisappear: ((FunctionalViewController, Bool) -> Void)?
    
    public var onShouldPerformSegue: ((FunctionalViewController, String, Any?) -> Bool)?
    public var onPrepare: ((FunctionalViewController, UIStoryboardSegue, Any?) -> Void)?
    public var onViewWillLayoutSubviews: ((FunctionalViewController) -> Void)?
    public var onViewDidLayoutSubviews: ((FunctionalViewController) -> Void)?
    public var onUpdateViewConstraints: ((FunctionalViewController) -> Void)?
    public var onViewLayoutMarginsDidChange: ((FunctionalViewController) -> Void)?
    public var onViewSafeAreaInsetsDidChange: ((FunctionalViewController) -> Void)?
    
    open override func loadView() {
        onLoadView?(self)
        super.loadView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad?(self)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onViewWillAppear?(self, animated)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onViewDidAppear?(self, animated)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onViewWillDisappear?(self, animated)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        onViewDidDisappear?(self, animated)
    }
    
    open override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return onShouldPerformSegue?(self, identifier, sender) ?? true
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        onPrepare?(self, segue, sender)
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        onViewWillLayoutSubviews?(self)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        onViewDidLayoutSubviews?(self)
    }
    
    open override func updateViewConstraints() {
        super.updateViewConstraints()
        onUpdateViewConstraints?(self)
    }
    
    open override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        onViewLayoutMarginsDidChange?(self)
    }
    
    open override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        onViewSafeAreaInsetsDidChange?(self)
    }
}
