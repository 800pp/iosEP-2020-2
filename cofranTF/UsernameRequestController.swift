//
//  UsernameRequestController.swift
//  cofranTF
//
//  Created by user178067 on 11/17/20.
//  Copyright © 2020 isil. All rights reserved.
//

import UIKit


class UsernameRequestController: UIViewController{
    
    @IBOutlet weak var txfUsername: UITextField!
    var username: String = ""
    
    @IBAction func pushPasswordController(_ sender: Any){
        username = txfUsername.text!
        performSegue(withIdentifier: "fromNametoPass", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        switch segue.destination {
        case is PasswordConfirmationController:
            let vc = segue.destination as! PasswordConfirmationController
            vc.username = self.username
        default:
            print("Segue no funciona")
        }
    }
    
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
