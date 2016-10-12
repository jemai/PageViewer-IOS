//
//  MenuCell.swift
//  PageViewer-IOS
//
//  Created by Abdelhak Jemaii on 12/10/2016.
//  Copyright © 2016 Abdelhak Jemaii. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var selectionView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionView.hidden = true

    }
   
    override var selected: Bool {
        didSet {
            if self.selected {
                self.selectionView.hidden = false
            }else {
                self.selectionView.hidden = true
                
            }
        }
    }
}
