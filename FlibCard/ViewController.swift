//
//  ViewController.swift
//  FlibCard
//
//  Created by Nem Sothea on 5/24/17.
//  Copyright © 2017 Nem Sothea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    var imgfront: UIImageView!
    var imgback: UIImageView!
    var showingBack: Bool = true


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let width:CGFloat = 100.0
//        let height:CGFloat = 100.0
//        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        singleTap.numberOfTapsRequired = 1
//        imgback = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgfront = UIImageView(image: UIImage(named: "front.jpg"))
        imgback = UIImageView(image: UIImage(named: "back.jpg"))
        imgfront.frame = CGRect(x: 0, y: 0, width: cardView.frame.width, height: cardView.frame.height)
        imgback.frame = CGRect(x: 0, y: 0, width: cardView.frame.width, height: cardView.frame.height)
        
//        cardView = UIView(frame: rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(imgback)
        
        self.view.addSubview(cardView)
        
    }
    func tapped() {
        print("Tapped!")
        if(showingBack) {
            UIView.transition(from: imgback, to: imgfront, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
           
            showingBack = false
        }else {
            UIView.transition(from: imgfront, to: imgback, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            showingBack = true
        }
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
//    private let reuseIdentifier = "CardCollectionViewCell"
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "CardCollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.flibCardAnimation()
        print("Fliped!!!")
    }
    
    
}

