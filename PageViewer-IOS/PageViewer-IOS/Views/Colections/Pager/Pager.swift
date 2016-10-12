//
//  Pager.swift
//  PageViewer
//
//  Created by Abdelhak Jemaii on 23/09/2016.
//  Copyright © 2016 Abdelhak Jemaii. All rights reserved.
//

import UIKit

class Pager: UICollectionView , UICollectionViewDataSource , UICollectionViewDelegate {
    
    //MARK : Variables
    var pagerDataSource  = [UIColor]()
    var flowLayou : UICollectionViewFlowLayout!
    var sharedNib = UINib(nibName: "SharedCell", bundle:nil)
    //
    var pagerDelegate : ViewPagerDelegate!
    
    // MARK: - initializers
    func initCollection(data : [UIColor]){

        self.dataSource = self
        self.delegate = self
        //
        let collectionViewLayout: CustomFlowLayout = CustomFlowLayout()
        collectionViewLayout.itemSize = CGSizeMake(self.frame.width, self.frame.height)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        //
        self.collectionViewLayout = collectionViewLayout
        self.registerNib(sharedNib, forCellWithReuseIdentifier: "SharedCell")
        self.backgroundColor = UIColor.whiteColor()
        
        self.pagerDataSource = data
    }
    // MARK: - Datasource and delegate implementations
    //
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pagerDataSource.count
    }
    //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : SharedCell = dequeueReusableCellWithReuseIdentifier("SharedCell", forIndexPath: indexPath) as! SharedCell
        cell.backgroundColor = self.pagerDataSource[indexPath.row]
        return cell
    }

    //
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        debugPrint(indexPath.row)
    }
    //
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = collectionView.bounds.size.height
        return CGSizeMake(collectionView.bounds.size.width,height)
    }
    //
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        pagerDelegate.scrollMenu(indexPath)

    }
    //
    func collectionView(collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return self.center
    }
    
}
