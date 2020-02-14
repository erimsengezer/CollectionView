//
//  ViewController.swift
//  gestureTest
//
//  Created by Erim on 14.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var slider: CustomUISlider!
    
    var labelY : CGFloat!
    var viewHeight : CGFloat!
    var viewYPos : CGPoint!
    var endPoint : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.isUserInteractionEnabled = true
        label2.isUserInteractionEnabled = true
        slider.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        label.addGestureRecognizer(gesture)
        slider.transform = CGAffineTransform(rotationAngle: CGFloat.pi + (CGFloat.pi / 2))
        let image = UIImage(named: "01slider")
        slider.setThumbImage(image, for: .normal)
        
    }

    @IBAction func sliderAction(_ sender: Any) {
        label2.text = String(Int(round(slider.value)))
    }
    
    @objc func pan(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .changed {
//            let translation = gesture.translation(in: self.labelView)
//            let newPos = CGPoint(x: label.center.x, y: label.center.y + translation.y)
//            label.center = newPos
//            gesture.setTranslation(CGPoint.zero, in: self.labelView)
//
//            endPoint = label.layer.presentation()?.frame.origin.y
//
//            var originY = (label2.layer.presentation()?.frame.origin.y)!
//
//            if endPoint - (label.frame.height / 2) <= 0 {
//                print("end")
//                gesture.state = .ended
//            }
//            else if endPoint >= 169 {
//                gesture.state = .ended
//            }
        
            print(slider.value)
        
        
        }
        
//        if gesture.state == .ended {
//            endPoint = label.layer.presentation()?.frame.origin.y
//            print(endPoint)
//
//        }
        
    }
    @IBAction func secondButton(_ sender: Any) {
        performSegue(withIdentifier: "goToSecond", sender: nil)
    }
    
}
