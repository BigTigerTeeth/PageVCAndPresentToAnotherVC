//
//  ViewController.swift
//  testUIView
//
//  Created by luckyxmobile on 16/10/2.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondDelegate {
    var label1 = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
       // self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
       // self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        //navigationBar.translucent 是否透明
        //self.navigationController?.navigationBar.translucent = false
        self.navigationController?.toolbarHidden = false
        self.navigationItem.prompt = "Tip place!!!"
        let view1 = UIView.init(frame: CGRect.init(x: 20, y: 20, width: 200, height: 200))
        view1.backgroundColor = UIColor.redColor()
        self.view.insertSubview(view1, atIndex: 0)
        let view2 = UIView.init(frame: CGRect.init(x: 50, y: 50, width: 200, height: 200))
        view2.backgroundColor = UIColor.greenColor()
        self.view.insertSubview(view2, atIndex: 1)
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        let fontarr = UIFont.familyNames()
        print(fontarr.count)
        label1  = UILabel.init(frame: CGRect.init(x: 10, y: 80, width: 150, height: 50))
        label1.backgroundColor = UIColor.lightGrayColor()
        label1.text = " 打火机看撒dbhsjdhkjasdjka好的开始打卡机爱上你"
        label1.textColor = UIColor.whiteColor()
        label1.textAlignment = .Right
        label1.font = UIFont.init(name: "Bradley Hand", size: 30)
        label1.lineBreakMode = .ByCharWrapping
        view1.addSubview(label1)
        let button1 = UIButton.init(frame: CGRect.init(x: 20, y: UIScreen.mainScreen().bounds.height-180, width: UIScreen.mainScreen().bounds.width-40, height: 50))
        button1.setTitle("Click to next controller", forState: .Normal)
        button1.backgroundColor = UIColor.lightGrayColor()
        button1.addTarget(self, action: #selector(click), forControlEvents: .TouchDown)
        button1.tag = 100
        self.view.addSubview(button1)
        let button11 = UIButton.init(frame: CGRect.init(x: 20, y: UIScreen.mainScreen().bounds.height-280, width: UIScreen.mainScreen().bounds.width-40, height: 50))
        button11.setTitle("push to next controller", forState: .Normal)
        button11.backgroundColor = UIColor.lightGrayColor()
        button11.tag = 101
        button11.addTarget(self, action: #selector(click), forControlEvents: .TouchDown)
        self.view.addSubview(button11)
        
        let backItem = UIBarButtonItem.init(title: "首页", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        let openVideoItem = UIBarButtonItem.init(barButtonSystemItem: .Pause, target: self, action: nil)
        let space = UIBarButtonItem.init(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let shareInfoItem = UIBarButtonItem.init(title: "分享", style: .Plain, target: self, action: nil)
        self.setToolbarItems([openVideoItem, space, shareInfoItem], animated: true)
    }

    func click(btn: UIButton) {
        let nextController = UIViewController2()
        nextController.delegate = self
        switch btn.tag {
        case 100:
            nextController.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(nextController, animated: true, completion: nil)
        case 101:
            self.navigationController?.pushViewController(nextController, animated: true)
        default:
            break
        }

     
    }
    func changeTitle(title: String){
        self.label1.text = title
    }
    func changeBackGroundColor(color: UIColor){
        self.navigationController?.navigationBar.barTintColor = color
    }
    override func didReceiveMemoryWarning() {
    }


}

