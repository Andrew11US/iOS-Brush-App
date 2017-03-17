//
//  ViewController.swift
//  Brush
//
//  Created by Andrew Foster on 2/7/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class DrawingVC: UIViewController {

    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(DrawingVC.appBecameActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        blueTapped(UIButton())
    }

    func appBecameActive() {
        self.buttonsStackView.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            self.lastPoint = point
        }
        
        
        self.buttonsStackView.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            print(point)
            
            drawBetweenPoints(self.lastPoint, secondPoint: point)
            
            self.lastPoint = point
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            print(point)
            
            drawBetweenPoints(self.lastPoint, secondPoint: point)
        }
        
        
        self.buttonsStackView.isHidden = false
    }
    
    func drawBetweenPoints(_ firstPoint:CGPoint, secondPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        context?.move(to: CGPoint(x: firstPoint.x, y: firstPoint.y))
        context?.addLine(to: CGPoint(x: secondPoint.x, y: secondPoint.y))
        
        //randomTapped(UIButton())
        context?.setStrokeColor(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)
        context?.setLineCap(.round)
        context?.setLineWidth(15)
        
        context?.strokePath()
        
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    func eraseDraw() {
        self.imageView.image = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settings" {
            let settingsVC = segue.destination as! SettingsVC
            settingsVC.drawingVC = self
        }
    }
    
    @IBAction func blueTapped(_ sender: AnyObject) {
        self.red = 0 / 255
        self.green = 112 / 255
        self.blue = 202 / 255
    }
    @IBAction func greenTapped(_ sender: AnyObject) {
        self.red = 0 / 255
        self.green = 193 / 255
        self.blue = 162 / 255
    }
    @IBAction func redTapped(_ sender: AnyObject) {
        self.red = 255 / 255
        self.green = 85 / 255
        self.blue = 70 / 255
    }
    @IBAction func yellowTapped(_ sender: AnyObject) {
        self.red = 255 / 255
        self.green = 249 / 255
        self.blue = 0 / 255
    }
    @IBAction func randomTapped(_ sender: AnyObject) {
        self.red = CGFloat(arc4random_uniform(256)) / 255
        self.green = CGFloat(arc4random_uniform(256)) / 255
        self.blue = CGFloat(arc4random_uniform(256)) / 255
    }

}

