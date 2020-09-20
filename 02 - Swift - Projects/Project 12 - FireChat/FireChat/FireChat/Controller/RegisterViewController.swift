//pri
//  RegisterViewController.swift
//  FireChat
//
//  Created by Kyle L. on 7/1/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func signUpPressed(_ sender: UIButton) {
       if let email = emailTextField.text, let password = passwordTextField.text{
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            if let e = error{
                print(e)
            }else{
                self.performSegue(withIdentifier: "registerToChat", sender: self)
            }
        }
        }
        
    }
    
}
