//
//  Menu.swift
//  PageViewer
//
//  Created by Abdelhak Jemaii on 23/09/2016.
//  Copyright © 2016 Abdelhak Jemaii. All rights reserved.
//
import UIKit

class Menu: UICollectionView , UICollectionViewDataSource , UICollectionViewDelegate {
    
    //MARK : Variables 
    var menuDataSource  = [UIColor]()
    var flowLayou : UICollectionViewFlowLayout!
    var sharedNib = UINib(nibName: "SharedCell", bundle:nil)
    var pagerDelegate : ViewPagerDelegate!
    
    //
    func initCollection(data : [UIColor]){
        self.dataSource = self
        self.delegate = self
        self.flowLayou = UICollectionViewFlowLayout()
        self.flowLayou.scrollDirection = .Horizontal
        self.collectionViewLayout = flowLayou
        self.registerNib(sharedNib, forCellWithReuseIdentifier: "SharedCell")
        self.backgroundColor = UIColor.whiteColor()
        self.menuDataSource = data

    }
    //
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return menuDataSource.count
    }
    //
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : SharedCell = dequeueReusableCellWithReuseIdentifier("SharedCell", forIndexPath: indexPath) as! SharedCell
        cell.backgroundColor = self.menuDataSource[indexPath.row]
        return cell
    }
    //
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        pagerDelegate.scrollPager(indexPath)
    }
    //
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = collectionView.bounds.size.height
        return CGSizeMake(height,height)
    }
    //
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //get refrence of horizontal indicator
        let horizontalIndicator = (scrollView.subviews[(scrollView.subviews.count - 2)] as! UIImageView)
        //set color to horizontal indicator
        //
        var frame =  horizontalIndicator.frame
        frame.size.width = self.frame.height
        horizontalIndicator.frame = frame
        horizontalIndicator.backgroundColor = UIColor.blueColor()
        
    }
}