//
//  ScanningViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/4/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit
import CoreBluetooth
import Firebase
import FirebaseDatabase

class ScanningViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var fullContact: String = ""
    
    var colorServ = ColorServiceManagerr()

    let uid = UserDefaults.standard.object(forKey: "uid")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startScanningAction(_ sender: UIButton) {
        let dataReceived : [String] = colorServ.tempData.components(separatedBy: "*")
        
        if dataReceived[0] != "" && dataReceived[1] != "" && dataReceived[2] != "" {
            nameLable.text = dataReceived[0]
            phoneLabel.text = dataReceived[1]
            emailLabel.text = dataReceived[2]
        }
        
    }
    @IBAction func saveToTable(_ sender: UIButton) {
        // deprecated - saves to local table instead of cloud
        fullContact = nameLable.text! + ", " + phoneLabel.text! + ", " + emailLabel.text!
        contactInformation.contactArray.append(fullContact)
        
        // save to firebase here
        let databaseRef = Database.database().reference()
        databaseRef.child(uid as! String).childByAutoId().setValue(fullContact)
    }
}

