//
//  ViewController.swift
//  Brush
//
//  Created by Andrew Foster on 2/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            print(point)
        }
        
        print("began")
        self.buttonsStackView.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            self.lastPoint = point
        }
        
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        
        let context = UIGraphicsGetImageFromCurrentImageContext()
        
        self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        context?.draw(at: CGPoint(x: self.lastPoint.x, y: self.lastPoint.y))
        
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ended")
        
        self.buttonsStackView.isHidden = false
    }

}

