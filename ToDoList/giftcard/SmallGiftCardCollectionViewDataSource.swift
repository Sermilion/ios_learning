//
//  SmallGiftCardCollectionViewDataSource.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/19/21.
//

import UIKit

class SmallGiftCardCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate var giftCards = [GiftCardModel]()
    
    override init() {
        
    }
    
    init(giftCards: [GiftCardModel]) {
        self.giftCards = giftCards
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GiftCardCell",
            for: indexPath
        ) as! GiftCardCollectionViewCell
        cell.setup(model: giftCards[indexPath.item])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.bounds.width / 2) - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
}
