//
//  SettingsVC.swift
//  Brush
//
//  Created by Andrew Foster on 2/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var brushSize: CustomView!
    @IBOutlet weak var activityViewBase: UIView!
    
    weak var drawingVC : DrawingVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        slider.value = Float(lineWidth)
        updateConstraintForBrush()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func eraseTapped(_ sender: AnyObject) {
        
        self.drawingVC?.eraseDraw()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func shareTapped(_ sender: AnyObject) {
        
        if let image = self.drawingVC?.imageView.image {
            
            let objectsToShare = [image]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            // iPad Activity VC popUp
            if let popActivityVC = activityVC.popoverPresentationController {
                popActivityVC.sourceView = activityViewBase
            }
            
            self.present(activityVC, animated: true, completion: nil)
        }
        

    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        lineWidth = Int(slider.value)
        updateConstraintForBrush()
        
    }
    
    func updateConstraintForBrush() {
        
        height.constant = CGFloat(slider.value)
        width.constant = CGFloat(slider.value)
        brushSize.layer.cornerRadius = CGFloat((slider.value) / 2)
        
    }
    
}
