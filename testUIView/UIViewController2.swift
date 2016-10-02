//
//  UIViewController2.swift
//  testUIView
//
//  Created by luckyxmobile on 16/10/2.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

protocol SecondDelegate: NSObjectProtocol {
    func changeTitle(title: String)
    func changeBackGroundColor(color: UIColor)
}

public class UIViewController2: UIViewController, UIScrollViewDelegate {
    var delegate: SecondDelegate?
    var scroll1 = UIScrollView()
    override public func viewDidLoad() {
        let seg = UISegmentedControl.init(items: ["聊天记录", "联系人"])
        seg.selectedSegmentIndex = 0
        self.navigationItem.titleView = seg
        let rightItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
        self.view.backgroundColor = UIColor.whiteColor()
        let button2 = UIButton.init(frame: CGRect.init(x: 20, y: UIScreen.mainScreen().bounds.height-180, width: UIScreen.mainScreen().bounds.width-40, height: 50))
        button2.setTitle("Click to last controller", forState: .Normal)
        button2.backgroundColor = UIColor.lightGrayColor()
        button2.tag = 10
        button2.addTarget(self, action: #selector(click), forControlEvents: .TouchDown)
        self.view.addSubview(button2)
        let button22 = UIButton.init(frame: CGRect.init(x: 20, y: UIScreen.mainScreen().bounds.height-280, width: UIScreen.mainScreen().bounds.width-40, height: 50))
        button22.setTitle("pop to last controller", forState: .Normal)
        button22.tag = 11
        button22.backgroundColor = UIColor.lightGrayColor()
        button22.addTarget(self, action: #selector(click), forControlEvents: .TouchDown)
        self.view.addSubview(button22)
        
        scroll1 = UIScrollView.init(frame: CGRect.init(x: 10, y: 50, width: 300, height: 200))
        scroll1.backgroundColor = UIColor.brownColor()
        self.view.addSubview(scroll1)
        
        let img = UIImage.init(named: "girl")
        let imgv = UIImageView.init(image: img)
        imgv.tag = 22
        scroll1.addSubview(imgv)
        scroll1.contentSize = img!.size
        scroll1.delegate = self
        scroll1.indicatorStyle = .White
        scroll1.bounces = false
        scroll1.minimumZoomScale = 0.5
        scroll1.maximumZoomScale = 10
        scroll1.userInteractionEnabled = true
    }
    public func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?{
        return scroll1.viewWithTag(22)
    }
    func click(btn: UIButton) {
        switch  btn.tag{
        case 10:
            self.dismissViewControllerAnimated(true, completion: nil)
        case 11:
            delegate!.changeTitle("value of transport")
            delegate!.changeBackGroundColor(UIColor.yellowColor())
            self.navigationController?.popViewControllerAnimated(true)
        default:
            break
        }
    }
}
