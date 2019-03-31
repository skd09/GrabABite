//
//  BaseModelView.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

protocol BaseModelViewDelegate {
    func baseModelViewDelegate_PositiveAction(baseViewModel : BaseModelView, parameters: AnyObject?...);
    func baseModelViewDelegate_DismissAction(baseViewModel : BaseModelView, parameters: AnyObject?...);
}


class BaseModelView: UIView {
    
    var baseModelViewDelegate : BaseModelViewDelegate?;
    var animationOn=true;
    var timer:Timer?;
    var angle,theY:Int?;
    var baseModelViewDelegate_PositiveAction:((_ baseViewModel:BaseModelView,_ parameters:AnyObject?...)->Void)?;
    var baseModelViewDelegate_DismissAction:((_ baseViewModel:BaseModelView,_ parameters:AnyObject?...)->Void)?;
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been happened");
    }
    
    init(baseModelViewDelegate : BaseModelViewDelegate?) {
        let window = UIApplication.shared.keyWindow;
        super.init(frame: CGRect(x: 0,
                                 y: (window?.frame.size.height)!,
                                 width: (window?.frame.size.width)!,
                                 height: (window?.frame.size.height)!));
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.baseModelViewDelegate = baseModelViewDelegate;
    }
    
    func modalViewDidShow()
    {
        
    }
    
    func registerToDismissThisModalView_On_A_Touch_To_BackGround()
    {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BaseModelView.registerToDismissThisModalView_On_A_Touch_To_BackGround_CallBack)));
    }
    
    func dimissPositive()->Void
    {
        if(animationOn)
        {
            UIView.animate(withDuration: 0.4, animations:
                {
                    self.frame = CGRect(x:0,y:self.frame.size.height, width:self.frame.size.width, height:self.frame.size.height)
            },
                           completion:
                {
                    (value: Bool) in
                    self.dimissPositiveCallBack();
                    self.removeFromSuperview();
            })
        }
        else
        {
            self.dimissPositiveCallBack();
            self.removeFromSuperview();
        }
    }
    
    func dimissPositiveCallBack()->Void
    {
    }
    
    func dimissNegative()->Void
    {
        if(animationOn)
        {
            UIView.animate(withDuration: 0.4, animations:
                {
                    self.frame = CGRect(x:0,y:self.frame.size.height, width: self.frame.size.width, height:self.frame.size.height)
            },
                           completion:
                {
                    (value: Bool) in
                    self.dimissNegativeCallBack();
                    self.removeFromSuperview();
            })
        }
        else
        {
            self.dimissNegativeCallBack();
            self.removeFromSuperview();
        }
    }
    
    func dimissNegativeCallBack()->Void
    {
        self.baseModelViewDelegate?.baseModelViewDelegate_DismissAction(baseViewModel: self, parameters: nil);
        self.baseModelViewDelegate_DismissAction?(self,nil);
    }
    
    func timerCallBack()->Void
    {
        if(self.angle! < 25)
        {
            self.angle = self.angle! + 2;
            
            // Set the anchor point and center so the view swings from the upper right
            self.layer.anchorPoint = CGPoint(x:0,y:0);
            self.center = CGPoint(x:0,y:0);
            
            // Rotate 90 degrees to hide it off screen
            var rotationTransform:CGAffineTransform = CGAffineTransform.identity //CGAffineTransformIdentity;
            let rotationValue=CGFloat(self.angle!);
            rotationTransform=rotationTransform.rotated(by: (CGFloat(self.angle!) / CGFloat(180.0) * CGFloat(M_PI)));
            self.transform = rotationTransform;
        }
        else
        {
            self.theY=self.theY! + 60;
            
            let tranlationTransform:CGAffineTransform = CGAffineTransform(translationX: 0,y: CGFloat(self.theY!));
            
            // Set the anchor point and center so the view swings from the upper right
            self.layer.anchorPoint = CGPoint(x:0,y:0);
            self.center = CGPoint(x:0,y:0);
            
            // Rotate 90 degrees to hide it off screen
            var rotationTransform:CGAffineTransform = tranlationTransform;
            rotationTransform = rotationTransform.rotated(by: (CGFloat(self.angle!) / CGFloat(180.0) * CGFloat(M_PI)));
            self.transform = rotationTransform;
            
            if(CGFloat(self.theY!) > self.frame.size.height)
            {
                timer?.invalidate();
                timer=nil;
                
                self.dimissNegativeCallBack();
                self.removeFromSuperview();
            }
        }
    }
    
    class func presentThisAsModalView(baseModelView:BaseModelView)->Void
    {
        let window = UIApplication.shared.keyWindow;
        window!.addSubview(baseModelView)
        
        if(baseModelView.animationOn)
        {
            UIView.animate(withDuration: 0.4, animations:
                {
                    baseModelView.frame = CGRect(x:0,y:0,width:baseModelView.frame.size.width,height:baseModelView.frame.size.height)
            },
                           completion:
                {
                    (value: Bool) in
                    baseModelView.modalViewDidShow();
            })
        }
        else
        {
            baseModelView.modalViewDidShow();
        }
    }
    
    class func presentThisAsModalView_InView(baseModelView:BaseModelView,inView:UIView)->Void
    {
        inView.addSubview(baseModelView)
        
        if(baseModelView.animationOn)
        {
            UIView.animate(withDuration: 0.4, animations:
                {
                    baseModelView.frame = CGRect(x:0,y:0,width:baseModelView.frame.size.width,height:baseModelView.frame.size.height)
            },
                           completion:
                {
                    (value: Bool) in
                    baseModelView.modalViewDidShow();
            })
        }
        else
        {
            baseModelView.modalViewDidShow();
        }
    }
    
    //Private Methods
    @objc func registerToDismissThisModalView_On_A_Touch_To_BackGround_CallBack()
    {
        dimissNegative();
    }
    
}
