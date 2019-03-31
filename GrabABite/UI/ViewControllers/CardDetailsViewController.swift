//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class CardDetailsViewController: BaseViewController, FloatingPlaceHolderTextFieldDelegate{
    
    private var cardNumberTF : FloatingPlaceHolderTextField!;
    private var nameTF : FloatingPlaceHolderTextField!;
    private var expiryTF : FloatingPlaceHolderTextField!;
    private var cvvTF : FloatingPlaceHolderTextField!;
    private var makePaymentButton : UIButton!;
    private var checkboxButton : UIButton!;
    private var checkLabel : UILabel!;
    private var isChecked:Bool = false;
    
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
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(CardDetailsViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.title = "Card Details";
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    
    private func prepareAndAdd_Views(){
        self.cardNumberTF = FloatingPlaceHolderTextField(frame: CGRect(x: 30,
                                                                     y: 30,
                                                                     width: self.viewWidth() - 30*2,
                                                                     height: 40),
                                                       floatingLabelText: "Card Number",
                                                       textFieldPlaceHolderText: "Card Number",
                                                       rightHandSide_ImageView_ImageName: nil,
                                                       leftHandSide_ImageView_ImageName: nil);
        self.cardNumberTF.delegate = self;
        self.cardNumberTF.setTextFieldKeyboardMode(type: .numberPad);
        self.view.addSubview(self.cardNumberTF);
        
        self.nameTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.cardNumberTF.frame.origin.x,
                                                                       y: self.cardNumberTF.frame.maxY + 5,
                                                                       width: self.viewWidth() - 30*2,
                                                                       height: 40),
                                                         floatingLabelText: "Name on Card",
                                                         textFieldPlaceHolderText: "Name on Card",
                                                         rightHandSide_ImageView_ImageName: nil,
                                                         leftHandSide_ImageView_ImageName: nil);
        self.nameTF.delegate = self
        self.nameTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.nameTF);
        
        self.expiryTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.nameTF.frame.origin.x,
                                                                 y: self.nameTF.frame.maxY + 5,
                                                                 width: self.viewWidth()/2 - 30*2,
                                                                 height: 40),
                                                   floatingLabelText: "Expiry Date",
                                                   textFieldPlaceHolderText: "Expiry Date",
                                                   rightHandSide_ImageView_ImageName: nil,
                                                   leftHandSide_ImageView_ImageName: nil);
        self.expiryTF.delegate = self
        self.expiryTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.expiryTF);
        
        self.cvvTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.expiryTF.frame.maxX + 60,
                                                                   y: self.nameTF.frame.maxY + 5,
                                                                   width: self.viewWidth()/2 - 30*2,
                                                                   height: 40),
                                                     floatingLabelText: "CVV",
                                                     textFieldPlaceHolderText: "CVV",
                                                     rightHandSide_ImageView_ImageName: nil,
                                                     leftHandSide_ImageView_ImageName: nil);
        self.cvvTF.delegate = self
        self.cvvTF.setTextFieldKeyboardMode(type: .numberPad)
        self.view.addSubview(self.cvvTF);
        
        
        self.checkboxButton = UIUtil.standardButton(title: "",
                                                      x: self.expiryTF.frame.origin.x + 50,
                                                      y: self.expiryTF.frame.origin.y + self.expiryTF.frame.size.height + 30,
                                                      width:20,
                                                      height: 20,
                                                      bgcolor: UIColor.white,
                                                      fontName: nil,
                                                      fontSize: 0,
                                                      titleColor: nil,
                                                      enableRoundedCorners: false,
                                                      target: self, action: #selector(CardDetailsViewController.onCheckboxClick));
        self.view.addSubview(self.checkboxButton);
        
        self.checkboxButton.setBackgroundImage(UIImage(named : "Unchecked"), for: .normal)
        
        self.checkLabel = UIUtil.standardLabel(text: "Save for future",
                                                    x: self.checkboxButton.frame.maxX + 20,
                                                    y: self.checkboxButton.frame.origin.y ,
                                                    width: self.nameTF.frame.size.width - self.checkboxButton.frame.size.width - 20,
                                                    height: self.checkboxButton.frame.size.height,
                                                    numberOfLines: 1, fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                    fontSize: 14);
        self.checkLabel.textColor = UIColor.black;
        self.view.addSubview(self.checkLabel);
        
        self.makePaymentButton = UIUtil.standardButton(title: "Make Payment",
                                                  x: 0,
                                                  y:  self.checkboxButton.frame.maxY + 30,
                                                  width: self.viewWidth() - 50*2,
                                                  height: 60,
                                                  bgcolor: AppConstants.COLOR_1,
                                                  fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                  fontSize: 20,
                                                  titleColor: UIColor.white,
                                                  enableRoundedCorners: true,
                                                  target: self,
                                                  action: #selector(CardDetailsViewController.onMakePaymentClick));
        self.makePaymentButton.layer.cornerRadius = 27;
        self.makePaymentButton?.frame.origin.x = (self.viewWidth()/2) - ((self.makePaymentButton?.frame.size.width)!/2);
        self.view.addSubview(self.makePaymentButton!);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
    
    @objc private func onMakePaymentClick(){
       self.navigationController?.pushViewController(SuccessViewController(), animated: true);
    }
    @objc private func onCheckboxClick(){
        self.isChecked = !(self.isChecked);
        
        if(self.isChecked)
        {
            self.checkboxButton.setBackgroundImage(UIImage(named: "Checked"), for: .normal);
        }
        else
        {
            self.checkboxButton.setBackgroundImage(UIImage(named : "Unchecked"), for: .normal)
        }
    }
    
    //MARK: Floating Text Field
    func customSalutationView_DidSelectIndex(customSaltutationView: CustomSalutationView, index: Int)
    {
        
    }
    func floatingPlaceHolderTextField_DidBeginEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField)
    {
        
    }
    
    func floatingPlaceHolderTextField_DidEndEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField)
    {
    }
    func floatingPlaceHolderTextField_TextFieldShouldBeginEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField) -> Bool
    {
        return true;
    }
    func floatingPlaceHolderTextField_TextFieldShouldReturn(floatingPlaceHolderTextField:FloatingPlaceHolderTextField) -> Bool
    {
        floatingPlaceHolderTextField.resignFirstResponder();
        return true;
    }
    
    func floatingPlaceHolderTextField_CharactersInTextField(floatingPlaceHolderTextField: FloatingPlaceHolderTextField, newString: String) {
        
    }
}
