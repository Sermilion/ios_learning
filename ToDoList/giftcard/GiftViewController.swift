//
//  GiftViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/13/21.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    private let colorData = [
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.orange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
    }
    
}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return colorData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath)
        cell.backgroundColor = colorData[indexPath.item]
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let rows: CGFloat = 2
        let collectionViewWidtgh = collectionView.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        let flowLayout  = collectionViewLayout as! UICollectionViewFlowLayout
        let itemSpacing = flowLayout.minimumInteritemSpacing
        let adjustedWidth = collectionViewWidtgh - itemSpacing
        let adjustedHeight = collectionViewHeight - itemSpacing
        let width: CGFloat = floor(adjustedWidth / 2)
        let height: CGFloat = floor(adjustedHeight / rows)
        return CGSize(width: width, height: height)
    }
}
