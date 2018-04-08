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
    let colorService = ColorServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func shareAction(_ sender: UIButton) {
        
        if let name = nameTextField.text, let phone = phoneTextField.text, let email = emailTextField.text{
        
            dataToSend = name + "*" + phone + "*" + email
            
            colorService.tempData = dataToSend
            colorService.send(colorName: dataToSend)
            //colorService.send(colorName: name)
            
            let destinationViewController = ScanningViewController(nibName: "ScanningViewController", bundle: nil)
            destinationViewController.colorServ = colorService
            
            
        }else {
            print("please, enter valid information")
        }
        
        

    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
