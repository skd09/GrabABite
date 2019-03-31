//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class SuccessViewController: BaseViewController{
    
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
            
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(SuccessViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.title = "Confirmation";
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
        

        let image = UIUtil.standardImageView(imageName: "Success",
                                             x: (self.messageContainerView.frame.width - 70)/2,
                                             y: 30,
                                             width: 70,
                                             height: 70);
        image.contentMode = .scaleAspectFit;
        self.messageContainerView.addSubview(image);
        
        let paymentLabel =  UIUtil.standardLabel(text: "Payment Completed",
                                            x: 20,
                                            y: image.frame.origin.y + image.frame.height + 10,
                                            width: self.messageContainerView.frame.width - 20*2,
                                            height: self.messageContainerView.frame.height,
                                            numberOfLines: 1,
                                            fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                            fontSize: 25);
        paymentLabel.sizeToFit();
        paymentLabel.frame.origin.x = (self.messageContainerView.frame.width - paymentLabel.frame.width)/2;
        paymentLabel.textColor = AppConstants.COLOR_3;
        self.messageContainerView.addSubview(paymentLabel);
        
        let messageLabel =  UIUtil.standardLabel(text: "We have sent you an email with all the details of the order and now you can grab your order.",
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
        
        let orderNoMessageLabel =  UIUtil.standardLabel(text: "Your order number",
                                                    x: messageLabel.frame.origin.x,
                                                    y: messageLabel.frame.origin.y + messageLabel.frame.height + 10,
                                                    width: self.messageContainerView.frame.width - 20*2,
                                                    height: self.messageContainerView.frame.height,
                                                    numberOfLines: 1,
                                                    fontName: AppConstants.HELVETICA_NEUE,
                                                    fontSize: 18);
        orderNoMessageLabel.sizeToFit();
        orderNoMessageLabel.textColor = UIColor.black;
        orderNoMessageLabel.frame.origin.x = (self.messageContainerView.frame.width - orderNoMessageLabel.frame.width)/2;
        self.messageContainerView.addSubview(orderNoMessageLabel);
        
        self.messageContainerView.frame = CGRect(x: 30,
                                                 y: 30,
                                                 width: self.viewWidth() - 2*30,
                                                 height: orderNoMessageLabel.frame.maxY + 10);
     
        
        self.orderNoContainerView = UIView(frame: CGRect(x: self.messageContainerView.frame.origin.x,
                                                         y: self.messageContainerView.frame.origin.y + self.messageContainerView.frame.height,
                                                         width: self.viewWidth() - 2*30,
                                                         height: 50));
        self.orderNoContainerView.backgroundColor = UIColor(red: 243, green: 243, blue: 243, alpha: 1);
        self.orderNoContainerView.layer.borderWidth = 1;
        self.orderNoContainerView.layer.borderColor = UIColor.black.cgColor;
        self.view.addSubview(self.orderNoContainerView);
        
        self.orderNoLabel = UIUtil.standardLabel(text: "400012",
                                                 x: 0,
                                                 y: 0,
                                                 width: 0,
                                                 height: self.orderNoContainerView.frame.height,
                                                 numberOfLines: 1,
                                                 fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                                 fontSize: 20);
        self.orderNoLabel.sizeToFit();
        self.orderNoLabel.textColor = AppConstants.COLOR_3;
        self.orderNoContainerView.addSubview(self.orderNoLabel);
        self.orderNoLabel.frame.origin.x = (self.orderNoContainerView.frame.width - self.orderNoLabel.frame.width)/2;
        self.orderNoLabel.frame.origin.y = (self.orderNoContainerView.frame.height - self.orderNoLabel.frame.height)/2;
        
        let smileImage = UIUtil.standardImageView(imageName: "Smile",
                                             x: self.orderNoContainerView.frame.origin.x,
                                             y: self.orderNoContainerView.frame.maxY + 40,
                                             width: 70,
                                             height: 70);
        smileImage.contentMode = .scaleAspectFit;
        smileImage.frame.origin.x = (self.viewWidth() - smileImage.frame.width)/2;
        self.view.addSubview(smileImage);
        
        let thanksLabel =  UIUtil.standardLabel(text: "Thank You",
                                                 x: self.orderNoContainerView.frame.origin.x,
                                                 y: smileImage.frame.origin.y + smileImage.frame.height + 10,
                                                 width:self.viewWidth() - 20*2,
                                                 height: 50,
                                                 numberOfLines: 1,
                                                 fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                                 fontSize: 20);
        thanksLabel.sizeToFit();
        thanksLabel.frame.origin.x = (self.viewWidth() - thanksLabel.frame.width)/2;
        self.view.addSubview(thanksLabel);
        
        
        self.backButton = UIUtil.standardButton(title: "Go Back",
                                                  x: 30,
                                                  y: thanksLabel.frame.origin.y + thanksLabel.frame.height + 30,
                                                  width: self.viewWidth() - 30*2,
                                                  height: 60,
                                                  bgcolor: AppConstants.COLOR_1,
                                                  fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                  fontSize: 20,
                                                  titleColor: UIColor.white,
                                                  enableRoundedCorners: true,
                                                  target: self,
                                                  action: #selector(SuccessViewController.onBackClick));
        self.backButton.layer.cornerRadius = 27;
        self.backButton?.frame.origin.x = (self.viewWidth()/2) - ((self.backButton?.frame.size.width)!/2);
        self.view.addSubview(self.backButton!);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
}
