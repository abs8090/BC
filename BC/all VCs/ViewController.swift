//
//  ViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 3/26/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var emailAdress: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMaster" {
            if segue.destination is MasterViewController{
                    // we can pass data here
            }
        }
    }
    
    // login here
    @IBAction func loginAction(_ sender: UIButton) {
        
        // save user to session
        let defaults =  UserDefaults.standard
        defaults.set(emailAdress.text!, forKey: "email")
        defaults.synchronize()
        
        Auth.auth().signIn(withEmail: emailAdress.text!, password: password.text!, completion: {(user, error) in
            
            if user != nil {
                // sign in success, save uid to session
                print("sign in succes")
                defaults.set(Auth.auth().currentUser?.uid, forKey: "uid")
                self.performSegue(withIdentifier: "goToMaster", sender: self)
            } else {
                // print error if sign in unsuccessful
                print("failed to sign in")
                if let myError = error?.localizedDescription {
                    print (myError)
                } else {
                    print("Error")
                }
            }
        })
    }
}

extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
