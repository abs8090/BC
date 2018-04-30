//
//  CustomCell.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/30/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    func configureProductCell(contact: String){
        let dataReceived : [String] = contact.components(separatedBy: ", ")
        
        
        
        nameLabel.text = dataReceived[0]
        phoneNumberLabel.text = dataReceived[1]
        emailAddressLabel.text = dataReceived[2]
        
    }
}
