//
//  SecondVCViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 3/26/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var saveEditOutlet: CustomButton!

    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var iCloudImport: CustomButton!
    
    @IBOutlet weak var modeSwitcher: UISegmentedControl!
    
    func initializeHBM(){
        contactsTableView.isHidden = false
        iCloudImport.isHidden = false
        
        fullName.isHidden = true
        phoneNumber.isHidden = true
        saveEditOutlet.isHidden = true
        emailInput.isHidden = true
    }
    
    func initializeCSM(){
        contactsTableView.isHidden = true
        iCloudImport.isHidden = true
        
        fullName.isHidden = false
        phoneNumber.isHidden = false
        saveEditOutlet.isHidden = false
        emailInput.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHBM()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchMode(_ sender: UISegmentedControl) {
        
        if modeSwitcher.selectedSegmentIndex == 0 {
            initializeHBM()
            
        }else{
            initializeCSM()
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
