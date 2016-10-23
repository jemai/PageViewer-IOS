//
//  Main.swift
//  PageViewer
//
//  Created by Abdelhak Jemaii on 23/09/2016.
//  Copyright © 2016 Abdelhak Jemaii. All rights reserved.
//

import UIKit

// MARK: - delegate
protocol ViewPagerDelegate {
    func scrollMenu(index : Int)
    func scrollPager(index : NSIndexPath)
}
//
class Main: UIViewController , ViewPagerDelegate {
    
    // MARK: - Variables and outlets
    @IBOutlet weak var menu: Menu!
    @IBOutlet weak var pager: Pager!
    //datasource of collections
    let data = [UIColor.blackColor(),UIColor.blueColor(),UIColor.greenColor(),UIColor.grayColor(),UIColor.redColor(),UIColor.blueColor()]
    
    let menuData = ["black","blue","green","gray","red","blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.menu.pagerDelegate = self
        self.pager.pagerDelegate = self
        //
        self.menu.initCollection()
        self.pager.initCollection()
        self.menu.selectItemAtIndexPath(NSIndexPath(forRow:0, inSection: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Protocole implementation
    func scrollMenu(indexPath : Int){
        let index = NSIndexPath(forRow:indexPath, inSection: 0)
        self.menu.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        self.menu.selectItemAtIndexPath(index, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)
    }
    //
    func scrollPager(index : NSIndexPath){
        self.pager.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        self.menu.selectItemAtIndexPath(index, animated: true, scrollPosition: UICollectionViewScrollPosition.CenteredHorizontally)

    }
    //
}
