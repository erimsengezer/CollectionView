//
//  CollectionViewCell.swift
//  gestureTest
//
//  Created by Erim on 14.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        textView.isEditable = false
    }
}
