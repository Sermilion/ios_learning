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
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange],
        [UIColor.purple,
         UIColor.red,
         UIColor.green,
         UIColor.yellow,
         UIColor.orange
        ]
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
        return colorData[section].count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! ColorCollectionViewCell
        let backgroundColor = colorData[indexPath.section][indexPath.item]
        cell.setup(backgroundColor: backgroundColor, cellNumber: indexPath.item)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let columns: CGFloat = 2
        let collectionViewWidtgh = collectionView.bounds.width
        let flowLayout  = collectionViewLayout as! UICollectionViewFlowLayout
        let itemSpacing = flowLayout.minimumInteritemSpacing
        let adjustedWidth = collectionViewWidtgh - itemSpacing
        let width: CGFloat = floor(adjustedWidth / columns)
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "sectionHeader", for: indexPath
            ) as! HeaderCollectionReusableView
            view.setup(count: colorData[indexPath.section].count)
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "sectionFooter", for: indexPath
            )
            view.backgroundColor = UIColor.purple
            return view
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return colorData.count
    }
}
