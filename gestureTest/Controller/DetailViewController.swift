//
//  DetailViewController.swift
//  gestureTest
//
//  Created by Erim on 14.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image : UIImage!
    var titleText : String!
    var text : String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.isEditable = false

        // Do any additional setup after loading the view.
        
         if let image = image {
            imageView.image = image
        }
        if let title = titleText {
            titleLabel.text = title
        }

        if let text = text {
            textLabel.text = text
        }
        
    }
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "goToAnimation", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToAnimation" {
                let vc = segue.destination as! AnimationViewController
                vc.choosenPhoto = self.image
            }
        }
    
    
}
