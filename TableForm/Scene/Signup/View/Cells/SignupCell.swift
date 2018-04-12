//
//  SignupCellTableViewCell.swift
//  TableForm
//
//  Created by dedé.exe on 12/04/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

protocol SignupCellDelegate : class {
    func signupCell(_ cell:SignupCell, send model:SignupModel)
}

class SignupCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var streetTextField : UITextField!
    @IBOutlet weak var numberTextField : UITextField!
    @IBOutlet weak var complementTextField : UITextField!
    @IBOutlet weak var neightborTextField : UITextField!
    @IBOutlet weak var cityTextField : UITextField!
    @IBOutlet weak var provinceTextField : UITextField!
    @IBOutlet weak var countryTextField : UITextField!
    
    weak var delegate : SignupCellDelegate!

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    @IBAction func confirm() {
        let model = createSignupModel()
        delegate?.signupCell(self, send: model)
    }
    
    func createSignupModel() -> SignupModel {
        var model = SignupModel()
        model.name = nameTextField.text
        model.street = streetTextField.text
        model.number = Int(numberTextField.text ?? "")
        model.neightbor = neightborTextField.text
        model.city = cityTextField.text
        model.province = provinceTextField.text
        model.country = countryTextField.text
        return model
    }
    
}
