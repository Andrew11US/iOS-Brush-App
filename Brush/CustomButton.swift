//
//  CustomButton.swift
//  BrainTeaser
//
//  Created by Andrew Foster on 2/6/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import pop

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
        didSet {
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(CustomButton.scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: #selector(CustomButton.scaleDefault), for: .touchDragExit)
    }
    
    func scaleToSmall() {
        
        let scaleAmim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAmim?.toValue = NSValue(cgSize: CGSize(width: 0.75, height: 0.75))
        self.layer.pop_add(scaleAmim, forKey: "LayerScaleSmallAnimation")

    }
    
    func scaleAnimation() {

        let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.velocity = NSValue(cgPoint: CGPoint(x: 3.0, y: 3.0))
        scaleAnim?.toValue = NSValue(cgPoint: CGPoint(x: 1.0, y: 1.0))
        scaleAnim?.springBounciness = 18.0
        self.layer.pop_add(scaleAnim, forKey: "LayerScaleSmallAnimation")
        
    }
    
    func scaleDefault() {
        
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        self.layer.pop_add(scaleAnim, forKey: "LayerScaleSmallAnimation")
    }
    
}
