//
//  DataModel.swift
//  gestureTest
//
//  Created by Erim on 14.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    
    var image : UIImage!
    var title : String!
    var text : String!
    
    init(image : UIImage, title : String, text: String) {
        self.image = image
        self.title = title
        self.text = text
    }
    
}
