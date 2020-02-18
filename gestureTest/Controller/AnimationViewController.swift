//
//  AnimationViewController.swift
//  gestureTest
//
//  Created by Erim on 18.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var plusButton: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardTextView: UITextView!
    @IBOutlet weak var cardImageView: UIImageView!
    
    var isOpen = false
    var choosenPhoto : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.label1.layer.opacity = 0
        self.label2.layer.opacity = 0
        self.label3.layer.opacity = 0
        
        cardTextView.isEditable = false
        cardImageView.image = choosenPhoto
        
        cardView.layer.borderColor = UIColor.gray.cgColor
        cardView.layer.borderWidth = 1
        
        menuLabel.isUserInteractionEnabled = true
        plusButton.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(menuAction))
        menuLabel.addGestureRecognizer(gesture)
        plusButton.addGestureRecognizer(gesture)
    }

    @objc private func menuAction() {
        label1.isHidden = false
        label2.isHidden = false
        label3.isHidden = false

        if isOpen == false {
            //            UIView.animate(withDuration: 0.5, animations: {
            //                self.label1.layer.opacity = 10
            //            }) { (isCompleted) in
            //                if isCompleted {
            //                    UIView.animate(withDuration: 0.2, animations: {
            //                        self.label2.layer.opacity = 10
            //                    }) { (isCompleted) in
            //                        UIView.animate(withDuration: 0.2) {
            //                            self.label3.layer.opacity = 10
            //                        }
            //                    }
            //                }
            //            }
            
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
                self.cardView.frame.origin.y += 180
                
                
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2 + CGFloat.pi / 4)
                self.label1.layer.opacity = 10
            }) { (isCompleted) in
                print("bam")
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: {
                self.label2.layer.opacity = 10
            }) { (isCompleted) in
                print("bam")
            }
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseIn, animations: {
                self.label3.layer.opacity = 10
            }) { (isCompleted) in
                print("bam")
            }
            
            isOpen = true
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 4)
                self.label3.layer.opacity = 0
            }) { (isCompleted) in
                print("bam")
                UIView.animate(withDuration: 0.5) {
                    self.cardView.frame.origin.y -= 180
                }
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.label2.layer.opacity = 0
            }) { (isCompleted) in
                print("bam")
            }
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
                self.label1.layer.opacity = 0
            }) { (isCompleted) in
                print("bam")
                
            }
            isOpen = false
        }
        print(isOpen)
    }

}
extension UIView {
    func keyboardMove() {
        NotificationCenter.default.addObserver(self, selector: #selector(move), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func move(_ notification: NSNotification) {
        let time = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginKeyboardFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endKeyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let currentY = endKeyboardFrame.origin.y - beginKeyboardFrame.origin.y
        
        UIView.animateKeyframes(withDuration: time, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += currentY
        }, completion: nil)
    }
}
