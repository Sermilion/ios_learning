//
//  GiftCardCollectionViewCell.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/19/21.
//

import UIKit

class GiftCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var giftCardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
        giftCardImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    func setup(model: GiftCardModel) {
        self.giftCardImageView.image = model.image
    }
    
}
