//
//  RecoverPasswordViewController.swift
//  cofranTF
//
//  Created by user178067 on 11/19/20.
//  Copyright © 2020 isil. All rights reserved.
//

import UIKit

class RecoverPasswordController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let lapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardClose))
        view.addGestureRecognizer(lapToCloseKeyboard)
    }
    
    @objc func keyboardClose(){
        view.endEditing(true)
    }
    
    @IBAction func popView(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
}
