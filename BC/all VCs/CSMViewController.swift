//
//  CSMViewController.swift
//  BC
//
//  Created by user134380 on 4/3/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit

class CSMViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var dataToSend = ""
    let bluetoothObj = BluetoothClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    @IBAction func shareAction(_ sender: UIButton) {
        
        if let name = nameTextField.text, let phone = phoneTextField.text, let email = emailTextField.text{
            dataToSend = name + "*" + phone + "*" + email
            bluetoothObj.tempData = dataToSend
            bluetoothObj.send(colorName: dataToSend)
            let destinationViewController = ScanningViewController(nibName: "ScanningViewController", bundle: nil)
            destinationViewController.bluetoothObj = bluetoothObj
            
        } else {
            print("please, enter valid information")
        }
    }
}
