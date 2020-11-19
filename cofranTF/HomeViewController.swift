//
//  HomeViewController.swift
//  cofranTF
//
//  Created by user178067 on 11/19/20.
//  Copyright © 2020 isil. All rights reserved.
//

import UIKit

class HomeViewController: ViewController{
    @IBOutlet weak var usernameLabel: UILabel!
    public var username: String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Bienvenido, \(username)"
    }
}
