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
    func scrollMenu(index : NSIndexPath)
    func scrollPager(index : NSIndexPath)
}
//
class Main: UIViewController , ViewPagerDelegate {
    
    // MARK: - Variables and outlets
    @IBOutlet weak var menu: Menu!
    @IBOutlet weak var pager: Pager!
    //datasource of collections
    let data = [UIColor.blackColor(),UIColor.blueColor(),UIColor.greenColor(),UIColor.grayColor(),UIColor.redColor(),UIColor.blueColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.menu.pagerDelegate = self
        self.pager.pagerDelegate = self
        //
        self.menu.initCollection(data)
        self.pager.initCollection(data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Protocole implementation
    func scrollMenu(index : NSIndexPath){
        self.menu.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    //
    func scrollPager(index : NSIndexPath){
        self.pager.scrollToItemAtIndexPath(index, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)

    }
    //
}
