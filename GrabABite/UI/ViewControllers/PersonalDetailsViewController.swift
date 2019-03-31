//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class PersonalDetailsViewController: BaseViewController, FloatingPlaceHolderTextFieldDelegate{
    
    private var nameTF : FloatingPlaceHolderTextField!;
    private var emailTF : FloatingPlaceHolderTextField!;
    private var idTF : FloatingPlaceHolderTextField!;
    private var phoneTF : FloatingPlaceHolderTextField!;
    private var proceedButton : UIButton!;
    
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
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(PersonalDetailsViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.title = "Personal Details";
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    
    private func prepareAndAdd_Views(){
        self.nameTF = FloatingPlaceHolderTextField(frame: CGRect(x: 30,
                                                                 y: 30,
                                                                 width: self.viewWidth() - 30*2,
                                                                 height: 40),
                                                   floatingLabelText: "Name",
                                                   textFieldPlaceHolderText: "Name",
                                                   rightHandSide_ImageView_ImageName: nil,
                                                   leftHandSide_ImageView_ImageName: nil);
        self.nameTF.delegate = self
        self.nameTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.nameTF);
        
        self.emailTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.nameTF.frame.origin.x,
                                                                  y: self.nameTF.frame.maxY + 5,
                                                                  width: self.viewWidth() - 30*2,
                                                                  height: 40),
                                                    floatingLabelText: "Email Id",
                                                    textFieldPlaceHolderText: "Email Id",
                                                    rightHandSide_ImageView_ImageName: nil,
                                                    leftHandSide_ImageView_ImageName: nil);
        self.emailTF.delegate = self
        self.emailTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.emailTF);
        
        self.idTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.emailTF.frame.origin.x,
                                                               y: self.emailTF.frame.maxY + 5,
                                                               width: self.viewWidth() - 30*2,
                                                               height: 40),
                                                 floatingLabelText: "Student/Staff Id",
                                                 textFieldPlaceHolderText: "Student/Staff Id",
                                                 rightHandSide_ImageView_ImageName: nil,
                                                 leftHandSide_ImageView_ImageName: nil);
        self.idTF.delegate = self
        self.idTF.setTextFieldKeyboardMode(type: .numberPad)
        self.view.addSubview(self.idTF);
        
        self.phoneTF = FloatingPlaceHolderTextField(frame: CGRect(x: self.idTF.frame.origin.x,
                                                                  y: self.idTF.frame.maxY + 5,
                                                                  width: self.viewWidth() - 30*2,
                                                                  height: 40),
                                                    floatingLabelText: "Contact No",
                                                    textFieldPlaceHolderText: "Contact No",
                                                    rightHandSide_ImageView_ImageName: nil,
                                                    leftHandSide_ImageView_ImageName: nil);
        self.phoneTF.delegate = self
        self.phoneTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.phoneTF);
        
        
        
        self.proceedButton = UIUtil.standardButton(title: "Proceed",
                                                   x: 0,
                                                   y:  self.phoneTF.frame.maxY + 30,
                                                   width: self.viewWidth() - 50*2,
                                                   height: 60,
                                                   bgcolor: AppConstants.COLOR_1,
                                                   fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                   fontSize: 20,
                                                   titleColor: UIColor.white,
                                                   enableRoundedCorners: true,
                                                   target: self,
                                                   action: #selector(PersonalDetailsViewController.onProceedClick));
        self.proceedButton.layer.cornerRadius = 27;
        self.proceedButton?.frame.origin.x = (self.viewWidth()/2) - ((self.proceedButton?.frame.size.width)!/2);
        self.view.addSubview(self.proceedButton!);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
    
    @objc private func onProceedClick(){
        self.navigationController?.pushViewController(CardDetailsViewController(), animated: true);
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
