//
//  UIViewControler+Keyboard.swift
//  TableForm
//
//  Created by Fabricio Santos on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class KeyboardOffsetHandler : NSObject {
    
    var onKeyboardShow : ((CGFloat)->Void)?
    var onKeyboardHide : (()->Void)?
    
    private weak var viewController : UIViewController!
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        startKeyboardObservers()
    }
    
    deinit {
        startKeyboardObservers()
    }
    
    private func startKeyboardObservers() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func stopKeyboardObservers() {
        let nc = NotificationCenter.default
        nc.removeObserver(viewController, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.removeObserver(viewController, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func showKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let offset = finalFrame.height
            
            onKeyboardShow?(offset)
            
            viewController.view.setNeedsUpdateConstraints()
            UIView.animate(withDuration: 0.2, animations: {[weak self] in
                self?.viewController.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func hideKeyboard(notification:Notification, completion:()->Void) {
        onKeyboardHide?()
        
        viewController.view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            self?.viewController.view.layoutIfNeeded()
        })
    }
    
}
