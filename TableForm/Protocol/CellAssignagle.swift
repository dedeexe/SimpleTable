//
//  CellAssignagle.swift
//  TableForm
//
//  Created by dedé.exe on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

protocol CellRegisterable : class {
    static func register(to tableView:UITableView!)
    static func register(to tableView:UITableView!, using nibName:String, identifiedBy identifier:String)
}

extension CellRegisterable where Self : UITableViewCell {
    
    static func register(to tableView:UITableView!) {
        let identifier = String(describing: self)
        register(to: tableView, using: identifier, identifiedBy: identifier)
    }
    
    static func register(to tableView:UITableView!, using nibName:String, identifiedBy identifier:String) {
        guard tableView != nil else {
            fatalError("No tableView present")
        }
        
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
}

