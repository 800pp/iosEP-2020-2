//
//  ViewController.swift
//  cofranTF
//
//  Created by user178067 on 11/17/20.
//  Copyright © 2020 isil. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var usernameTextFierd: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var password : String  = ""
    private var usernames: String = ""
    
    @IBAction func goToRegistration(_ sender: Any){
        performSegue(withIdentifier: "fromHometoName", sender: self)
        
    }
    @objc func keyboardClose(){
        view.endEditing(true)
    }
    
    @IBAction func goToRecover(_ sender: Any){
        performSegue(withIdentifier: "fromHometoRecover", sender: self)    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let lapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(keyboardClose))
        view.addGestureRecognizer(lapToCloseKeyboard)
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSignIn(_ sender: Any){
        usernames = usernameTextFierd.text!
        password = passwordTextField.text!
        Auth.auth().signIn(withEmail: usernames, password: password){
            (res, error) in
            if let res = res, error == nil{
                print(res.user.email!)
                self.performSegue(withIdentifier: "fromLogintoHome", sender: self)
            }else{
                print(error.debugDescription)
                let alertController = UIAlertController(title: "Error", message: "Hubo un error al ingresar", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
                self.present(alertController,animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is HomeViewController:
            let vc = segue.destination as! HomeViewController
            vc.username = self.usernames
        default:
            print("Segue not from ViewController")
        }
    }


}

