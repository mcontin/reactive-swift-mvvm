//
//  UILabel.swift
//  MVVM
//
//  Created by Mattia on 28/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

extension UILabel {
    
    // Calculate expected label height
    static func heightForLabel(text: String, withFont font: UIFont, withMargin margin: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - margin, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.font = font
        label.text = text
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        return label.frame.height
    }
    
}
