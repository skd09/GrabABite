//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 13/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class FailureViewController: BaseViewController{
    
    private var messageContainerView : UIView!;
    private var orderNoContainerView : UIView!;
    private var orderNoLabel : UILabel!;
    private var backButton : UIButton!;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidLayoutSubviews() {
        if(!isUISetUpDone){
            
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(FailureViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.title = "Failed";
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    private func prepareAndAdd_Views(){
        self.messageContainerView = UIView(frame: CGRect(x: 30,
                                                         y: 30,
                                                         width: self.viewWidth() - 2*30,
                                                         height: self.viewHeight()/2));
        self.messageContainerView.backgroundColor = UIColor(red: 243, green: 243, blue: 243, alpha: 1);
        self.messageContainerView.layer.borderWidth = 1;
        self.messageContainerView.layer.borderColor = UIColor.black.cgColor;
        self.view.addSubview(self.messageContainerView);
        
        
        let image = UIUtil.standardImageView(imageName: "Failure",
                                             x: (self.messageContainerView.frame.width - 70)/2,
                                             y: 30,
                                             width: 70,
                                             height: 70);
        image.contentMode = .scaleAspectFit;
        self.messageContainerView.addSubview(image);
        
        let paymentLabel =  UIUtil.standardLabel(text: "Oops!!! It Failed",
                                                 x: 20,
                                                 y: image.frame.origin.y + image.frame.height + 10,
                                                 width: self.messageContainerView.frame.width - 20*2,
                                                 height: self.messageContainerView.frame.height,
                                                 numberOfLines: 1,
                                                 fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                                 fontSize: 25);
        paymentLabel.sizeToFit();
        paymentLabel.frame.origin.x = (self.messageContainerView.frame.width - paymentLabel.frame.width)/2;
        paymentLabel.textColor = AppConstants.COLOR_1;
        self.messageContainerView.addSubview(paymentLabel);
        
        let messageLabel =  UIUtil.standardLabel(text: "Something went wrong while placing this order. Please retry properly.",
                                                 x: 20,
                                                 y: paymentLabel.frame.origin.y + paymentLabel.frame.height + 10,
                                                 width: self.messageContainerView.frame.width - 20*2,
                                                 height: self.messageContainerView.frame.height,
                                                 numberOfLines: 5,
                                                 fontName: AppConstants.POPPINS_REGULAR,
                                                 fontSize: 16);
        messageLabel.sizeToFit();
        messageLabel.textAlignment = .center;
        messageLabel.textColor = UIColor.gray;
        messageLabel.frame.origin.x = (self.messageContainerView.frame.width - messageLabel.frame.width)/2;
        self.messageContainerView.addSubview(messageLabel);
        
        
        self.messageContainerView.frame = CGRect(x: 30,
                                                 y: 30,
                                                 width: self.viewWidth() - 2*30,
                                                 height: messageLabel.frame.maxY + 30);
        
    
        
        let sadImage = UIUtil.standardImageView(imageName: "Sad",
                                                  x: self.messageContainerView.frame.origin.x,
                                                  y: self.messageContainerView.frame.maxY + 40,
                                                  width: 70,
                                                  height: 70);
        sadImage.contentMode = .scaleAspectFit;
        sadImage.frame.origin.x = (self.viewWidth() - sadImage.frame.width)/2;
        self.view.addSubview(sadImage);
        
        let sorryLabel =  UIUtil.standardLabel(text: "Sorry",
                                                x: self.messageContainerView.frame.origin.x,
                                                y: sadImage.frame.origin.y + sadImage.frame.height + 10,
                                                width:self.viewWidth() - 20*2,
                                                height: 50,
                                                numberOfLines: 1,
                                                fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                                fontSize: 20);
        sorryLabel.sizeToFit();
        sorryLabel.frame.origin.x = (self.viewWidth() - sorryLabel.frame.width)/2;
        self.view.addSubview(sorryLabel);
        
        
        self.backButton = UIUtil.standardButton(title: "Try Again",
                                                x: 30,
                                                y: sorryLabel.frame.origin.y + sorryLabel.frame.height + 30,
                                                width: self.viewWidth() - 30*2,
                                                height: 60,
                                                bgcolor: AppConstants.COLOR_1,
                                                fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                fontSize: 20,
                                                titleColor: UIColor.white,
                                                enableRoundedCorners: true,
                                                target: self,
                                                action: #selector(FailureViewController.onBackClick));
        self.backButton.layer.cornerRadius = 27;
        self.backButton?.frame.origin.x = (self.viewWidth()/2) - ((self.backButton?.frame.size.width)!/2);
        self.view.addSubview(self.backButton!);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
}
