//
//  CustomButton.swift
//  Brush
//
//  Created by Andrew Foster on 2/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
