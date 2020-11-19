//
//  PasswordConfirmationController.swift
//  cofranTF
//
//  Created by user178067 on 11/17/20.
//  Copyright © 2020 isil. All rights reserved.
//

import UIKit
import FirebaseAuth

class PasswordConfirmationController: UIViewController{
    
    @IBOutlet weak var helloUserLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordVerificationTextField: UITextField!
    public var username: String = ""
    private var password: String = ""
    private var passwordVerification: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        helloUserLabel.text = "Hola! " + username
        let lapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardClose))
        view.addGestureRecognizer(lapToCloseKeyboard)
    }
    
    @objc func keyboardClose(){
        view.endEditing(true)
    }
    
    public func putUsername(username: String){
        self.username = username
    }
    
    @IBAction func popView(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleRegistration(_ sender: Any){
        password = passwordTextField.text!
        passwordVerification = passwordVerificationTextField.text!
        if password == passwordVerification {
            Auth.auth().createUser(withEmail: username, password: password) {
                (res,error) in
                if  let res = res, error == nil{
                    print(res.user.email!)
                    self.performSegue(withIdentifier: "fromPasswordtoHome", sender: self)
                }else{
                    print(error.debugDescription)
                    let alertController = UIAlertController(title: "Error", message: "Hubo un error al registrate", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
                    self.present(alertController,animated: true)
                }
            }
        }else{
            let alertController = UIAlertController(title: "Error", message: "Contraseñas diferentes, intente de nuevo", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
            self.present(alertController,animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is HomeViewController:
            let vc = segue.destination as! HomeViewController
            vc.username = self.username
        default:
            print("Segue error")
        }
    }
}
