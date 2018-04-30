//
//  DesignCell.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 4/30/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignCell: UIView{
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = .black
    @IBInspectable var shadowOffSetWidth: Int = 0
    @IBInspectable var shadowOffSetHeight: Int = 0
    @IBInspectable var shadowOpacity: Float = 0.2
    
    override func layoutSubviews(){
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
        
    }
    
    
}
