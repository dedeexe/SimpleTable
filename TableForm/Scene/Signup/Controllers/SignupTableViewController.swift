//
//  SignupTableViewController.swift
//  TableForm
//
//  Created by dedé.exe on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

protocol SignupTableViewControllerDelegate : class {
    func send(model:SignupModel)
}

class SignupTableViewController : NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private weak var tableView : UITableView!
    private weak var delegate : SignupTableViewControllerDelegate?
    
    init(tableView:UITableView, delegate:SignupTableViewControllerDelegate) {
        super.init()
        
        self.delegate = delegate
        self.tableView = tableView
        setup()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(at: indexPath) as SignupCell
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func setup() {
        SignupCell.register(to: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SignupTableViewController : SignupCellDelegate {
    func signupCell(_ cell: SignupCell, send model: SignupModel) {
        delegate?.send(model: model)
    }
}
