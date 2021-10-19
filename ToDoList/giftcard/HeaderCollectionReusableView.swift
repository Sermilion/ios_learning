//
//  HeaderCollectionReusableView.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/18/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    func setup(count: Int) {
        headerLabel.text = "Colors: \(count)"
    }
}
