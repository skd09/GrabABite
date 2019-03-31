//
//  LoginViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, FloatingPlaceHolderTextFieldDelegate, BaseModelViewDelegate{
    
    private var collegeNamePickerModel : CustomPickerModelView!;
    private var campusPickerModel : CustomPickerModelView!;
    private var collegeNameTF : UILabel!;
    private var campusTF : UILabel!;
    
    private var passwordTF : FloatingPlaceHolderTextField!;
    private var submitButton : UIButton!;
    private var cancelLbl : UILabel!;
    private var collegeArray : Array<String> = ["Conestoga College","University of Waterloo", "Laurier"];
    private var campusArray : Array<String> = ["Kitchcner","Waterloo","Cambridge","Guelph"];
    private var getCollegeListBO : GetCollegeListBO!;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.isHidden = true;
        self.hideRightNavigationBarItem()
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
            self.title = "Login"
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            self.view.backgroundColor = UIColor.white
            
            getCollegeList();
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    
    private func prepareAndAdd_Views(){
        self.collegeArray.append("Select");
        self.campusArray.append("Select");
        
        let bannerImage = UIUtil.standardImageView(imageName: "Coffee",
                                                   x: 0,
                                                   y: 0,
                                                   width: self.viewWidth(),
                                                   height: 300);
        //bannerImage.contentMode = .scaleAspectFill;
        self.view.addSubview(bannerImage);
        
        let view = UIView.init(frame: CGRect(x: 0,
                                             y: 0,
                                             width: self.viewWidth(),
                                             height: 300));
        view.backgroundColor = UIColor.black;
        view.alpha = 0.7;
        self.view.addSubview(view);
        
        let title = UIUtil.standardLabel(text: "LOGIN",
                                         x: 0,
                                         y: 0,
                                         width: 150,
                                         height: view.frame.size.height/2,
                                         numberOfLines: 1,
                                         fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                         fontSize: 40);
        title.textColor = UIColor.white;
        self.view.addSubview(title);
        title.frame.origin.y = (view.frame.size.height - title.frame.size.height)/2;
        title.frame.origin.x = (view.frame.size.width - title.frame.size.width)/2;
        
        let collegeLabel = UIUtil.standardLabel(text: "College Name",
                                                x: 30,
                                                y: view.frame.origin.y + view.frame.size.height + 20,
                                                width: view.frame.size.width,
                                                height: 30,
                                                numberOfLines: 1,
                                                fontName: AppConstants.POPPINS_REGULAR,
                                                fontSize: 14)
        collegeLabel.textColor = UIColor.black;
        self.view.addSubview(collegeLabel);
        
        self.collegeNameTF = UIUtil.standardLabel(text: "Select",
                                                  x: collegeLabel.frame.origin.x,
                                                  y: collegeLabel.frame.maxY,
                                                  width: collegeLabel.frame.size.width - 30*2,
                                                  height: 30,
                                                  numberOfLines: 1,
                                                  fontName: AppConstants.POPPINS_REGULAR,
                                                  fontSize: 16);
        self.collegeNameTF.textColor = UIColor.gray;
        self.collegeNameTF.isUserInteractionEnabled = true;
        self.collegeNameTF.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.onCollegeNameClick)));
        self.view.addSubview(self.collegeNameTF);
        
        let divider = UIUtil.lineView(orientation: .Horizontal,
                                      color: AppConstants.COLOR_2,
                                      x: self.collegeNameTF.frame.origin.x + 5,
                                      y: self.collegeNameTF.frame.maxY,
                                      length: collegeLabel.frame.width - 30*2,
                                      thickness: 0.75)
        self.view.addSubview(divider);
        
        let dropwdown = UIUtil.standardImageView(imageName: "ic_down_arrow_gray",
                                                 x: self.collegeNameTF.frame.maxX - 10,
                                                 y: self.collegeNameTF.frame.origin.y + 10,
                                                 width: 20,
                                                 height: 20)
        dropwdown.isUserInteractionEnabled = true;
        dropwdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.onCollegeNameClick)))
        self.view.addSubview(dropwdown);
        
        
        let campusNameLabel = UIUtil.standardLabel(text: "Campus",
                                                x: 30,
                                                y: divider.frame.origin.y + divider.frame.size.height + 20,
                                                width: view.frame.size.width,
                                                height: 30,
                                                numberOfLines: 1,
                                                fontName: AppConstants.POPPINS_REGULAR,
                                                fontSize: 14)
        campusNameLabel.textColor = UIColor.black;
        self.view.addSubview(campusNameLabel);
        
        self.campusTF = UIUtil.standardLabel(text: "Select",
                                                  x: campusNameLabel.frame.origin.x,
                                                  y: campusNameLabel.frame.maxY,
                                                  width: campusNameLabel.frame.size.width - 30*2,
                                                  height: 30,
                                                  numberOfLines: 1,
                                                  fontName: AppConstants.POPPINS_REGULAR,
                                                  fontSize: 16);
        self.campusTF.textColor = UIColor.gray;
        self.campusTF.isUserInteractionEnabled = true;
        self.campusTF.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.onCampusClick)));
        self.view.addSubview(self.campusTF);
        
        let divider1 = UIUtil.lineView(orientation: .Horizontal,
                                      color: AppConstants.COLOR_2,
                                      x: self.campusTF.frame.origin.x + 5,
                                      y: self.campusTF.frame.maxY,
                                      length: campusNameLabel.frame.width - 30*2,
                                      thickness: 0.75)
        self.view.addSubview(divider1);
        
        let dropwdown1 = UIUtil.standardImageView(imageName: "ic_down_arrow_gray",
                                                 x: self.campusTF.frame.maxX - 10,
                                                 y: self.campusTF.frame.origin.y + 10,
                                                 width: 20,
                                                 height: 20)
        dropwdown1.isUserInteractionEnabled = true;
        dropwdown1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.onCampusClick)))
        self.view.addSubview(dropwdown1);
        
        
        self.passwordTF = FloatingPlaceHolderTextField(frame: CGRect(x:30,
                                                                  y: dropwdown1.frame.origin.y + dropwdown1.frame.size.height,
                                                                  width: self.viewWidth() - 30*2,
                                                                  height: 40),
                                                    floatingLabelText: "Password",
                                                    textFieldPlaceHolderText: "Password",
                                                    rightHandSide_ImageView_ImageName: nil,
                                                    leftHandSide_ImageView_ImageName: nil);
        self.passwordTF.delegate = self
        //self.passwordTF.isSecureTextEntry = true;
        self.passwordTF.setTextFieldKeyboardMode(type: .default)
        self.view.addSubview(self.passwordTF);
//        self.passwordTF = UIUtil.standardTextField_custom_underline(text: nil, placeholder: "Password",
//                                                                    x: 30,
//                                                                    y: dropwdown1.frame.origin.y + dropwdown1.frame.size.height + 30,
//                                                                    width: self.viewWidth() - 30*2,
//                                                                    height: 40,
//                                                                    fontSize: 16,
//                                                                    requirePadding: false);
//        self.passwordTF?.isSecureTextEntry = true;
//        self.view.addSubview(self.passwordTF!);
        
        self.submitButton = UIUtil.standardButton(title: "Submit",
                                                   x: 0,
                                                   y:  self.viewHeight() - 100,
                                                   width: self.viewWidth()/2,
                                                   height: 60,
                                                   bgcolor: AppConstants.COLOR_1,
                                                   fontName: AppConstants.POPPINS_SEMI_BOLD,
                                                   fontSize: 20,
                                                   titleColor: UIColor.white,
                                                   enableRoundedCorners: true,
                                                   target: self,
                                                   action: #selector(LoginViewController.onSubmitClick));
        self.submitButton.layer.cornerRadius = 27;
        self.submitButton?.frame.origin.x = (self.viewWidth()/2) - ((self.submitButton?.frame.size.width)!/2);
        self.view.addSubview(self.submitButton!);
    }
    
    //MARK: Click Functions
    @objc func onCollegeNameClick(){
        self.collegeNamePickerModel = CustomPickerModelView(baseModelViewDelegate: self,
                                                            title: "Select a college name",
                                                            dataArray: [collegeArray]);
        self.collegeNamePickerModel.tag = 1;
        BaseModelView.presentThisAsModalView(baseModelView: self.collegeNamePickerModel);
        self.collegeNamePickerModel.setPickerValue(position: 0);
    }
    @objc func onCampusClick(){
        self.campusPickerModel = CustomPickerModelView(baseModelViewDelegate: self,
                                                            title: "Select a campus",
                                                            dataArray: [collegeArray]);
        self.campusPickerModel.tag = 1;
        BaseModelView.presentThisAsModalView(baseModelView: self.campusPickerModel);
        self.campusPickerModel.setPickerValue(position: 0);
    }
    
    @objc private func onSubmitClick(){
        self.navigationController?.pushViewController(RestaurantViewController(), animated: true);
    }
    
    
    //MARK: Floating Text Field
    func customSalutationView_DidSelectIndex(customSaltutationView: CustomSalutationView, index: Int) {
       
        
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
    
    
    func baseModelViewDelegate_DismissAction(baseViewModel baseModelView: BaseModelView, parameters: AnyObject?...)
    {
        if((baseModelView as? CustomPickerModelView) != nil)
        {
        }
    }
    
    //MARK: BaseModel View
    func baseModelViewDelegate_PositiveAction(baseViewModel baseModelView: BaseModelView, parameters: AnyObject?...)
    {
        let selectedValue = (parameters[0] as! String);
        if((baseModelView as? CustomPickerModelView) == self.collegeNamePickerModel){
            self.collegeNameTF.text = selectedValue;
//            let index = self.collegeNameTF.index(ofAccessibilityElement: selectedValue)
//            self.collegeNamePickerModel.setPickerValue(position: index);
        }else{
            self.campusTF.text = selectedValue;
        }
    }
    
    //MARK: College List
    private func getCollegeList()
    {
        
        self.startAnimating(CGSize(width:50, height:50),
                            message: nil,
                            messageFont: nil,
                            type: .ballClipRotate,
                            color: AppConstants.COLOR_1,
                            padding: nil,
                            displayTimeThreshold: nil,
                            minimumDisplayTime: nil);
        
        let getCollegeListDO = GetCollegeListDO();
        //getCollegeListDO.prepareRequestWithParameters(parameters: );
        getCollegeListDO.queryTheServer {
            (baseDO:BaseDO!) in
            self.stopAnimating();
            
            if(baseDO.serverErrorBO != nil)
            {
                if(baseDO.serverErrorBO!.isSessionExpired)
                {
                }
                else if(baseDO.serverErrorBO!.errorText != nil)
                {
                    let errorTextToDisplay = baseDO.serverErrorBO!.errorText!;
                    
                    let alertController = UIAlertController(title: "Something's Wrong!", message: errorTextToDisplay, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
                    alertController.addAction(defaultAction);
                    
                    self.present(alertController, animated: true, completion: nil);
                }
            }
            else
            {
                // Response received successfully.
                
                if(self.getCollegeListBO != nil)
                {
                    self.getCollegeListBO = nil;
                }
                
                self.getCollegeListBO = (getCollegeListDO.response as! GetCollegeListResponse).getCollegeListBO;
                
                if((self.getCollegeListBO?.collegeListArray != nil) && !(self.getCollegeListBO?.collegeListArray?.isEmpty)!)
                {
                    //self.myTripsTableView.reloadData();
                    print(self.getCollegeListBO?.collegeListArray);
                }
                else
                {
                    let alertController = UIAlertController(title: self.getCollegeListBO?.statusMsg!, message: nil, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
                    alertController.addAction(defaultAction);
                    
                    self.present(alertController, animated: true, completion: nil);
                }
            }
        }
    }
    
}
