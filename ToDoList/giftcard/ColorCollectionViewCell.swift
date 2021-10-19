//
//  ColorCollectionViewCell.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/18/21.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func setup(backgroundColor: UIColor, cellNumber: Int) {
        self.backgroundColor = backgroundColor
        numberLabel.text = String(cellNumber)
    }
}
