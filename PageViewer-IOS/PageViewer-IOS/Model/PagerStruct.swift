//
//  PagerStruct.swift
//  PageViewer-IOS
//
//  Created by Abdelhak Jemaii on 12/10/2016.
//  Copyright © 2016 Abdelhak Jemaii. All rights reserved.
//

import Foundation
import UIKit

struct PagerStruct {
    
    init(title : String , cell : UICollectionViewCell){
        self.pageTitle = title
        self.pageContent = cell
    }
    
    var pageContent = UICollectionViewCell()
    var pageTitle = ""
}