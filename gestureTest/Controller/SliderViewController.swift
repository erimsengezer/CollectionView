//
//  SliderViewController.swift
//  gestureTest
//
//  Created by Erim on 19.02.2020.
//  Copyright © 2020 Erim. All rights reserved.
//

import Foundation
import UIKit

class SliderViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    let images = ["google", "amazon", "instagram","facebook", "apple"]
//    let companies = ["Google", "Amazon", "Instagram", "Facebook", "Apple"]
    
    
    let pages = [
     
        Page(imageName: "google", title: "Google", description: "\n\nGoogle, İnternet araması, çevrim içi bilgi dağıtımı, reklam teknolojileri ve arama motorları için yatırımlar yapan çok uluslu Amerikan anonim şirketidir. İnternet tabanlı hizmet ve ürünler geliştirir, ek olarak bunlara ev sahipliği yapar."),
        Page(imageName: "amazon", title: "Amazon", description: "\n\nAmazon.com, Inc., kısaca Amazon, Amerika Birleşik Devletleri merkezli bir e-ticaret ve bulut bilişim şirketidir. Jeff Bezos tarafından 5 Temmuz 1994'te Amerika Birleşik Devletleri'nin Seattle şehrinde kurulmuştur. Gerek toplam satış hacmi, gerekse piyasa değeri açısından dünyanın en büyük alışveriş sitesidir."),
        Page(imageName: "instagram", title: "Instagram", description: "\n\nInstagram, sosyal medyada ücretsiz fotoğraf ve video paylaşma uygulaması. Ekim 2010'da kurulduğunda, kullanıcılarına çektikleri bir fotoğraf üzerinde dijital filtre kullanma ve bu fotoğrafı Instagram'ın da dahil olduğu, sosyal medya servisleri ile paylaşma imkanı tanımıştır"),
        Page(imageName: "facebook", title: "Facebook", description: "\n\nFacebook, insanların başka insanlarla iletişim kurmasını ve bilgi alışverişi yapmasını amaçlayan bir sosyal ağ. 4 Şubat 2004 tarihinde Harvard Üniversitesi 2006 devresi öğrencisi Mark Zuckerberg tarafından kurulan Facebook, öncelikle Harvard öğrencileri için kurulmuştu."),
        Page(imageName: "apple", title: "Apple", description: "\n\nApple Inc. ya da eski adıyla Apple Computer, Inc., merkezi Cupertino'da bulunan; tüketici elektroniği, bilgisayar yazılımı ve kişisel bilgisayar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirkettir."),
        Page(imageName: "tesla", title: "Tesla", description: "\n\nTesla Motors, Inc., 2003 yılında Martin Eberhard tarafından kurulmuş* elektrikli araç ve elektrikli araç motor parçaları tasarlayan, üreten ve satan bir Amerikan şirketidir. TSLA sembolü ile NASDAQ borsasında işlem gören halka açık şirkettir."),
    ]
    
    private let previousButton : UIButton = {
    
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(previousButtonClicked), for: .touchUpInside)
    
        return button
    }()
    
    private let nextButton : UIButton = {
    
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.newRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    
        return button
    }()
    
    private lazy var pageControl : UIPageControl = {
       
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = UIColor.newRed
        pageControl.pageIndicatorTintColor = UIColor.oRed
        
        return pageControl
        
    }()
    
    fileprivate func buttonControl() {
        
        let buttonStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
        
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    @objc func nextButtonClicked() {
        var count = pageControl.currentPage
        pageControl.currentPage += 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        count += 1
        if count == pages.count {
            print("last")
            pageControl.currentPage = 0
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            count = 0
        }
    }
    
    @objc func previousButtonClicked() {
        pageControl.currentPage -= 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        buttonControl()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }) { (_) in
            print("adas")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
//        cell.imageView.image = UIImage(named: pages[indexPath.row].imageName)
//        cell.companyNameText.text = pages[indexPath.row].title
//        cell.companyNameText.font = UIFont.boldSystemFont(ofSize: 20)
        
        cell.page = pages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
}
