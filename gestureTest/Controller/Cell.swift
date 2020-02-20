//
//  Cell.swift
//  gestureTest
//
//  Created by Erim on 19.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import Foundation
import UIKit

class Cell : UICollectionViewCell {
    
    var page : Page? {
        didSet {
            guard let page = page else {return}
            
            imageView.image = UIImage(named: page.imageName)
            let text = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
            
            text.append(NSAttributedString(string: page.description, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
            
            companyNameText.attributedText = text
            companyNameText.textAlignment = .center
        }
    }
    
    let images = ["google", "amazon", "instagram","facebook", "apple"]
    
    private let imageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "google"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let companyNameText : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let text = NSMutableAttributedString(string: "Google", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        
        text.append(NSAttributedString(string: "\n\nGoogle, İnternet araması, çevrim içi bilgi dağıtımı, reklam teknolojileri ve arama motorları için yatırımlar yapan çok uluslu Amerikan anonim şirketidir. İnternet tabanlı hizmet ve ürünler geliştirir, ek olarak bunlara ev sahipliği yapar.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
        
        textView.attributedText = text
        
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        editLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("Fatal Error")
    }
    
    private func editLayout() {
        let superView = UIView()
        addSubview(superView)
        
        superView.translatesAutoresizingMaskIntoConstraints = false
        
        superView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        superView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        superView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        superView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        superView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
        superView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        
        addSubview(companyNameText)
        
        companyNameText.topAnchor.constraint(equalTo: superView.bottomAnchor, constant: 10).isActive = true
        companyNameText.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        companyNameText.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        companyNameText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
}

extension UIColor {
    static var newRed = UIColor(red: 229/255, green: 70/255, blue: 129/255, alpha: 1)
    static var oRed = UIColor(red: 250/255, green: 210/255, blue: 215/255, alpha: 1)
}
