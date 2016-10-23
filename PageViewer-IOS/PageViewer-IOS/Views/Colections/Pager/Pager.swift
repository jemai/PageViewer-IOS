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
    var flowLayou : UICollectionViewFlowLayout!
    var sharedNib = UINib(nibName: "SharedCell", bundle:nil)
    //
    var pagerDelegate : ViewPagerDelegate!
    
    // MARK: - initializers
    func initCollection(){

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
        
    }
    // MARK: - Datasource and delegate implementations
    //
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataConstant.dataSource.count
    }
    //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : SharedCell = dequeueReusableCellWithReuseIdentifier("SharedCell", forIndexPath: indexPath) as! SharedCell
        cell.backgroundColor = DataConstant.dataSource[indexPath.row].0
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
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        //pagerDelegate.scrollMenu(indexPath)
        
    }
    //
    func collectionView(collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return self.center
    }
    //
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let x = self.contentOffset.x
        let w = self.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage == 0 {
            pagerDelegate.scrollMenu(currentPage)
        }else {
            pagerDelegate.scrollMenu(currentPage - 1)
        }
    }
}
