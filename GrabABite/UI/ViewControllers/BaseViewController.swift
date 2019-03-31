//
//  BaseViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable
{
    var isUISetUpDone :  Bool = false;
    var scrollView : UIScrollView?;
    var addButton : UIButton?;
    
    override func loadView()
    {
        self.scrollView = UIScrollView(frame: CGRect.zero);
        self.view = scrollView;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.edgesForExtendedLayout=[];
        self.view.backgroundColor=UIColor.white;
        
        
        self.addButton = UIButton(type: .custom)
        //self.addButton?.setImage(UIImage(named: "ic_edit_blue"), for: .normal)
        self.addButton?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.addButton?.addTarget(self, action: #selector(BaseViewController.addBarButtonTapped), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: self.addButton!)
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    
    func hideRightNavigationBarItem(){
        self.addButton?.isHidden = true;
    }
    
    func registerFor_This_ViewController_Entering_ForeGround_State()
    {
//        NotificationCenter.default.addObserver(self, selector:#selector(BaseViewController.viewControllerEnteredForeGroundState), name:
//            NSNotification.Name.UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func deregisterFor_This_ViewController_Entering_ForeGround_State()
    {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil);
    }
    
    @objc func viewControllerEnteredForeGroundState()
    {
    }
    
    @objc func addBarButtonTapped(){
//        self.navigationController?.pushViewController(presentViewController(), animated: true);
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewWidth() -> CGFloat
    {
        return self.view.frame.size.width;
    }
    
    func viewHeight() -> CGFloat
    {
        return self.view.frame.size.height;
    }
    
    deinit
    {
        deregisterFor_This_ViewController_Entering_ForeGround_State();
    }
    
}
