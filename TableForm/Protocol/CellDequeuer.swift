//
//  File.swift
//  TableForm
//
//  Created by dedé.exe on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

protocol CellDequeuer {
    func dequeueCell<T:UITableViewCell>(at index:IndexPath) -> T
    func dequeueCell<T:UITableViewCell>(identifiedBy identifier:String, at index:IndexPath) -> T
}

extension CellDequeuer where Self : UITableView {
    func dequeueCell<T:UITableViewCell>(at index:IndexPath) -> T {
        let identifier = String(describing: T.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: index) as? T else {
            fatalError("No cell \(identifier) found")
        }
        
        return cell
    }
    
    func dequeueCell<T:UITableViewCell>(identifiedBy identifier:String, at index:IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: index) as? T else {
            fatalError("Cell not identifierd by \(identifier) not found")
        }
        
        return cell
    }
}
