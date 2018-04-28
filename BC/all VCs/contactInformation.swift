//
//  contactInformation.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/26/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import Foundation

class contactInformation {
    static var contactArray = [String]()
    
    var contactInfo: String
    
    private init(){
        self.contactInfo = ""
    }
    init(contactInfo: String) {
        self.contactInfo = contactInfo
    }
}
