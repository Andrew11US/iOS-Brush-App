//
//  CustomView.swift
//  Brush
//
//  Created by Andrew Foster on 3/20/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
