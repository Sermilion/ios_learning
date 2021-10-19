//
//  GiftViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/13/21.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    @IBOutlet weak var thankYouCollectionView: UICollectionView!
    
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var thankYouHeigthConstraint: NSLayoutConstraint!
    
    private var thankYouDataSource: SmallGiftCardCollectionViewDataSource?
    
    private var seasonalGiftCards = [GiftCardModel]()
    //    {
    //        didSet {
    //            seasonalCollectionView.reloadData()
    //        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.thankYouDataSource = SmallGiftCardCollectionViewDataSource(giftCards: cards)
            self.thankYouCollectionView.delegate = self.thankYouDataSource
            self.thankYouCollectionView.dataSource = self.thankYouDataSource
            self.thankYouCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setHeightOfCollectionViews()
    }
    
    func setHeightOfCollectionViews() {
        let width = seasonalCollectionView.bounds.width - 30
        let height = width / 1.5
        seasonalHeightConstraint.constant = height
        thankYouHeigthConstraint.constant = height / 2
    }
    
}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GiftCardCell",
            for: indexPath
        ) as! GiftCardCollectionViewCell
        cell.setup(model: seasonalGiftCards[indexPath.item])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
}
