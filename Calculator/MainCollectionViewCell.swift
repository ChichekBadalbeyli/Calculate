//
//  MainCollectionViewCell.swift
//  Calculator
//
//  Created by Chichek on 13.11.24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    var selectedElement: ((Int)-> Void)?
    @IBOutlet var myButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func buttonAction(_ sender: Any) {
        selectedElement?(tag)
    }
    
    
}
