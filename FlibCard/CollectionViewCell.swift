//
//  CollectionViewCell.swift
//  FlibCard
//
//  Created by Nem Sothea on 5/24/17.
//  Copyright © 2017 Nem Sothea. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let kCardBackTag: Int = 0
    let kCardFrontTag: Int = 1
    var cardView: (frontView:UIImageView,backView:UIImageView)?
    
    var imgViewFront:UIImageView!
    var imageViewBack: UIImageView!
    override func awakeFromNib() {
        imgViewFront = createCardViewWithImage(imageName: "front.jpg", tag: self.kCardFrontTag)
        imageViewBack = createCardViewWithImage(imageName: "back.jpg", tag: self.kCardBackTag)
        contentView.addSubview(imageViewBack)
    }
    
    private func createCardViewWithImage(imageName:String, tag: Int) -> UIImageView {
        let newCardImageView = UIImageView(frame: self.frame)
        newCardImageView.image = UIImage(named: imageName)
        newCardImageView.tag = tag
        return newCardImageView
    }
    func flibCardAnimation() {
        if (imageViewBack.superview != nil) {
            cardView = (frontView: imgViewFront, backView: imageViewBack)
        }else{
            cardView = (frontView:imageViewBack, backView: imgViewFront)
        }
        let transitionOption = UIViewAnimationOptions.transitionFlipFromRight
        UIView.transition(with: self.contentView, duration: 0.5, options: transitionOption, animations: {
            self.cardView!.backView.removeFromSuperview()
            self.contentView.addSubview(self.cardView!.frontView)
        }, completion: {
            finished in
            //Code to do some stuff more
        })
    }
    
}
