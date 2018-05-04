

import UIKit
@IBDesignable

class CustomButton: UIButton {
    
    @IBInspectable var buttonBotder: CGFloat = 0{
        
        didSet{
            self.layer.borderWidth = buttonBotder
        }
    }
    
    @IBInspectable var buttonBorderColor: UIColor = .clear{
        didSet{
            self.layer.borderColor = buttonBorderColor.cgColor
        }
    }
    
    @IBInspectable var buttonCornerRaduis: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = buttonCornerRaduis
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }
    
}


