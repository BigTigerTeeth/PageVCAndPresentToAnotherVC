//
//  PageViewController.swift
//  testUIView
//
//  Created by luckyxmobile on 16/10/2.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIScrollViewDelegate {
    var startClosure: (() -> Void)?
    var pageControllll: UIPageControl?
    var screenWidth = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        let scroll = UIScrollView.init(frame: self.view.bounds)
        scroll.delegate = self
        scroll.pagingEnabled = true
        scroll.userInteractionEnabled = true
        self.view.addSubview(scroll)
        //screenWidth = self.view.bounds.width
        screenWidth = 320
        for i in 0...3{
            let imgv = UIImageView.init(frame: CGRectMake(screenWidth*CGFloat(i), 0, screenWidth, self.view.bounds.size.height))
            let img = UIImage.init(named: "img\(i+1).jpg")
            imgv.image = img
            if i == 3 {
                let btn = UIButton.init(type: .System)
                btn.frame = CGRectMake(10, 400, 300, 44)
                btn.setTitle("立即体验", forState: .Normal)
                btn.backgroundColor = UIColor.lightGrayColor()
                btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
                btn.addTarget(self, action: #selector(startAction), forControlEvents: .TouchUpInside)
                imgv.addSubview(btn)
                imgv.userInteractionEnabled = true
            }
            scroll.addSubview(imgv)
        }
        scroll.contentSize = CGSizeMake(screenWidth*4, self.view.bounds.height)
        
        
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.center = CGPointMake(160, 360)
        self.view.addSubview(pageControl)
        pageControllll = pageControl
        pageControl.pageIndicatorTintColor = UIColor.blackColor()
        pageControl.currentPageIndicatorTintColor = UIColor.yellowColor()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/screenWidth
        pageControllll?.currentPage = Int(index)
    }
    func startAction()  {
        startClosure!()
    }
}
