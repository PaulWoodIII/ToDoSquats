//
//  OnboardViewController.swift
//  ToDoSquats
//
//  Created by Paul Wood on 8/9/16.
//  Copyright © 2016 Paul Wood. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class OnboardViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField)
        
        if textField == self.emailField {
            print(textField.text)
            
            textField.resignFirstResponder()
            
            self.passField.becomeFirstResponder()
        }
        return true
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        if let email = self.emailField.text {
            if let password = self.passField.text {
                
                self.createUser(email, password: password)
            }
        }
    }
    
    func createUser(email: String, password: String) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                print(user.uid)
                print("success! create")
            }
        }
    }
 
    
    
    
}