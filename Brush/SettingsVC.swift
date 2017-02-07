//
//  SettingsVC.swift
//  Brush
//
//  Created by Andrew Foster on 2/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    weak var drawingVC : DrawingVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func eraseTapped(_ sender: AnyObject) {
        self.drawingVC?.eraseDraw()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareTapped(_ sender: AnyObject) {
        if let image = self.drawingVC?.imageView.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
}
