//
//  FloatingPlaceHolderTextField.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 10/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import UIKit

protocol FloatingPlaceHolderTextFieldDelegate
{
    func floatingPlaceHolderTextField_DidBeginEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField);
    func floatingPlaceHolderTextField_DidEndEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField);
    func floatingPlaceHolderTextField_CharactersInTextField(floatingPlaceHolderTextField:FloatingPlaceHolderTextField, newString:String);
    func floatingPlaceHolderTextField_TextFieldShouldBeginEditing(floatingPlaceHolderTextField:FloatingPlaceHolderTextField) -> Bool;
    func floatingPlaceHolderTextField_TextFieldShouldReturn(floatingPlaceHolderTextField:FloatingPlaceHolderTextField) -> Bool;
}

extension FloatingPlaceHolderTextFieldDelegate
{
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
        return true;
    }
}



class FloatingPlaceHolderTextField : UIView, UITextFieldDelegate
{
    var delegate:FloatingPlaceHolderTextFieldDelegate?;
    private var floatingLabel:UILabel!;
    private var textField:UITextField!;
    private var horizontalLineView:UIView!;
    private var rightHandSide_ImageView:UIImageView?;
    private var leftHandSide_ImageView:UIImageView?;
    
    private var floatingLabelText:String!;
    private var textFieldPlaceHolderText:String!;
    private var rightHandSide_ImageView_ImageName:String?
    private var leftHandSide_ImageView_ImageName:String?
    
    private var originalY_Position_Of_FloatingLabel:CGFloat!;
    
    init(frame: CGRect, floatingLabelText:String, textFieldPlaceHolderText:String, rightHandSide_ImageView_ImageName:String?, leftHandSide_ImageView_ImageName:String?)
    {
        super.init(frame:frame);
        
        self.floatingLabelText = floatingLabelText;
        self.textFieldPlaceHolderText = textFieldPlaceHolderText;
        self.leftHandSide_ImageView_ImageName = leftHandSide_ImageView_ImageName;
        self.rightHandSide_ImageView_ImageName = rightHandSide_ImageView_ImageName;
        //        self.layer.borderWidth=1;
        self.prepareViews();
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TextFieldDelegate Methods
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        // return (delegate?.floatingPlaceHolderTextField_TextFieldShouldBeginEditing(floatingPlaceHolderTextField: self))!;
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        delegate?.floatingPlaceHolderTextField_DidBeginEditing(floatingPlaceHolderTextField: self);
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        delegate?.floatingPlaceHolderTextField_DidEndEditing(floatingPlaceHolderTextField: self);
    }
    
    func getTextField() -> UITextField{
        return self.textField
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with:string);
        
        if((newString.count) > 0)
        {
            self.showFloatingLabel();
        }
        else if((newString.count) == 0)
        {
            self.hideFloatingLabel();
        }
        
        delegate?.floatingPlaceHolderTextField_CharactersInTextField(floatingPlaceHolderTextField: self, newString: newString);
        
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder();
        return false;//(delegate?.floatingPlaceHolderTextField_TextFieldShouldReturn(floatingPlaceHolderTextField: self))!;
    }
    
    
    //MARK: Public Methods
    
    func getText()->String
    {
        return self.textField.text!
    }
    
    func setText(text:String)
    {
        self.textField.text = text;
    }
    
    func setTextFieldKeyboardMode(type:UIKeyboardType)
    {
        self.textField.keyboardType = type;
    }
    
    func changeImage_Of_RightHandSide_ImageView(imageName:String)
    {
        if(self.rightHandSide_ImageView != nil)
        {
            self.rightHandSide_ImageView!.image = UIImage(named: imageName);
        }
    }
    
    func changeColor_Of_HorizontalLineView(color:UIColor)
    {
        if(self.horizontalLineView != nil)
        {
            self.horizontalLineView.backgroundColor = color;
        }
    }
    
    func characterCount()->Int
    {
        return self.textField.text!.count;
    }
    
    
    func makeTextFieldAs_SecureEntry()
    {
        self.textField.isSecureTextEntry = true;
    }
    
    func makeTextFieldAs_PlainEntry()
    {
        self.textField.isSecureTextEntry = false;
    }
    
    func hideFloatingLabel()
    {
        UIView.animate(withDuration: 0.25, animations: ({
            self.floatingLabel.frame.origin.y = self.textField.frame.origin.y;
            self.floatingLabel.isHidden = true;
        }), completion: nil);
    }
    
    //MARK: Private Methods
    
    private func prepareViews()
    {
        var theX:CGFloat = self.frame.size.width;
        let theY:CGFloat = 5;
        
        //Adding RightHandSide_ImageView
        if(rightHandSide_ImageView_ImageName != nil)
        {
            self.rightHandSide_ImageView = UIUtil.standardImageView(imageName: self.rightHandSide_ImageView_ImageName!, x: theX, y: theY, width: 0, height: 0);
            self.addSubview(self.rightHandSide_ImageView!);
            self.rightHandSide_ImageView!.frame.origin.x = theX - self.rightHandSide_ImageView!.frame.size.width - AppConstants.PADDING_10;
            
            theX = self.rightHandSide_ImageView!.frame.origin.x - AppConstants.PADDING_10;
        }
        
        if(leftHandSide_ImageView_ImageName != nil)
        {
            self.leftHandSide_ImageView = UIUtil.standardImageView(imageName: self.leftHandSide_ImageView_ImageName!, x: 0, y: 0, width: 0, height: 0);
            self.addSubview(self.leftHandSide_ImageView!);
            //self.leftHandSide_ImageView!.frame.origin.y = theY - self.leftHandSide_ImageView!.frame.size.height - AppConstants.PADDING_10;
            
            //theX = self.rightHandSide_ImageView!.frame.origin.x - AppConstants.PADDING_10;
        }
        
        
        // Prepare and add the floatingLabel
        self.floatingLabel = UIUtil.standardLabel(text: self.floatingLabelText, x: 0, y: theY, width: theX - AppConstants.PADDING_30, height: 0, numberOfLines: 0, fontName: AppConstants.POPPINS_REGULAR, fontSize: 14);
        self.floatingLabel.isHidden = true;
        self.floatingLabel.textColor = UIColor.lightGray;
        self.addSubview(self.floatingLabel);
        
        
        // Prepare and add textField
        self.textField = UIUtil.standardTextField(text: "", placeHolderText: self.textFieldPlaceHolderText, x: 0,
                                                  y: self.floatingLabel.frame.origin.y + self.floatingLabel.frame.size.height + AppConstants.PADDING_5,
                                                  width: theX - AppConstants.PADDING_5,
                                                  height: AppConstants.PADDING_30,
                                                  fontName: AppConstants.POPPINS_REGULAR, fontSize: 16, delegate: self);
        self.textField.borderStyle=UITextField.BorderStyle.none;
        self.textField.attributedPlaceholder=NSAttributedString(string:self.textFieldPlaceHolderText,
                                                                attributes:[NSAttributedString.Key.foregroundColor:UIColor.black])
        self.textField.textColor = UIColor.black;
        self.addSubview(self.textField);
        
        
        // Resize height of self
        self.frame.size.height = self.textField.frame.origin.y + self.textField.frame.size.height + AppConstants.PADDING_2;
        
        // Prepare and add the horizontalLineView
        
        let horizontalLineViewThickness:CGFloat = 0.75;
        
        self.horizontalLineView = UIUtil.lineView(orientation: AppConstants.LineViewOrientation.Horizontal, color: AppConstants.COLOR_2, x: 0, y: self.frame.size.height - horizontalLineViewThickness, length: self.frame.size.width, thickness: horizontalLineViewThickness);
        self.addSubview(self.horizontalLineView);
        
        // Reposition the imageView to verticalCenter
        if(rightHandSide_ImageView != nil)
        {
            self.rightHandSide_ImageView!.frame.origin.y = self.textField.frame.origin.y + (self.rightHandSide_ImageView!.frame.size.height/2);
            //            self.rightHandSide_ImageView!.layer.borderWidth=1;
        }
        
        if(leftHandSide_ImageView != nil)
        {
            self.leftHandSide_ImageView!.frame.origin.y = self.textField.frame.origin.y + (self.leftHandSide_ImageView!.frame.size.height/2);
            //            self.rightHandSide_ImageView!.layer.borderWidth=1;
        }
        
        //        self.textField.layer.borderColor = UIColor.yellow.cgColor;
        //        self.textField.layer.borderWidth = 1.0
        //        self.floatingLabel.backgroundColor = UIColor.green;
        
        
        // position floatingLabel behind the textField;
        self.originalY_Position_Of_FloatingLabel = self.floatingLabel.frame.origin.y;
        self.floatingLabel.frame.origin.y = self.textField.frame.origin.y;
        
    }
    
    private func showFloatingLabel()
    {
        UIView.animate(withDuration: 0.25, animations: ({
            self.floatingLabel.isHidden = false;
            self.floatingLabel.frame.origin.y = self.originalY_Position_Of_FloatingLabel;
        }), completion: nil);
    }
    
}
