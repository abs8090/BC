//
//  ScanningViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/4/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit
import CoreBluetooth

class ScanningViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var fullContact: String = ""
    
    var colorServ = ColorServiceManagerr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startScanningAction(_ sender: UIButton) {
        let dataReceived : [String] = colorServ.tempData.components(separatedBy: "*")
        
        
        
        nameLable.text = dataReceived[0]
        phoneLabel.text = dataReceived[1]
        emailLabel.text = dataReceived[2]
        
    }
    @IBAction func saveToTable(_ sender: UIButton) {
        fullContact = nameLable.text! + "\n" + phoneLabel.text! + "\n" + emailLabel.text!
        contactInformation.contactArray.append(fullContact)
    }
    
}

