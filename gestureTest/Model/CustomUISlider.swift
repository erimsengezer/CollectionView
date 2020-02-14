//
//  CustomSlider.swift
//  gestureTest
//
//  Created by Erim on 14.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import Foundation
import UIKit

class CustomUISlider : UISlider {
    
    var customBounds : CGRect!
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {

        //keeps original origin and width, changes height, you get the idea
        customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 20.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }

    //while we are here, why not change the image here as well? (bonus material)
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
