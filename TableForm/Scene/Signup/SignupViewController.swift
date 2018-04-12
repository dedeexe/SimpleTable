//
//  ViewController.swift
//  TableForm
//
//  Created by dedé.exe on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomConstraint : NSLayoutConstraint!
    
    var keyboardOffsetHandler : KeyboardOffsetHandler!
    var tableViewController : SignupTableViewController!
    var model : SignupModel?
    
    var bottomOffset : CGFloat = 0.0 {
        didSet { updateTableViewBottomOffset() }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setup() {        
        tableViewController = SignupTableViewController(tableView: tableView, delegate: self)
        keyboardOffsetHandler = KeyboardOffsetHandler(viewController: self)
        
        keyboardOffsetHandler.onKeyboardShow = { [weak self] height in
            self?.bottomOffset = height
            self?.updateTableViewBottomOffset()
        }
        
        keyboardOffsetHandler.onKeyboardHide = { [weak self] in
            self?.bottomOffset = 0.0
            self?.updateTableViewBottomOffset()
        }
    }
}

extension SignupViewController : SignupTableViewControllerDelegate {
    func send(model: SignupModel) {
        self.model = model
        print(self.model)
    }
}

extension SignupViewController {
    func updateTableViewBottomOffset() {
        bottomConstraint.constant = bottomOffset
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomOffset, right: 0)
    }
}
