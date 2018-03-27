//
//  SecondVCViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 3/26/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    
    
    @IBOutlet weak var saveEditOutlet: CustomButton!
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var contactsTableView: UITableView!
    
    @IBOutlet weak var modeSwitcher: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.isHidden = true
        phoneNumber.isHidden = true
        saveEditOutlet.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchMode(_ sender: UISegmentedControl) {
        
        if modeSwitcher.selectedSegmentIndex == 0 {
            contactsTableView.isHidden = false
            
            fullName.isHidden = true
            phoneNumber.isHidden = true
            saveEditOutlet.isHidden = true
        }else{
            contactsTableView.isHidden = true
            
            fullName.isHidden = false
            phoneNumber.isHidden = false
            saveEditOutlet.isHidden = false
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
