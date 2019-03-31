//
//  UIUtil.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class UIUtil {
    
    class func standardLabel(text:String,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,numberOfLines:Int,fontName:String?,fontSize:Int)->UILabel
    {
        let label:UILabel=UILabel(frame: CGRect(x: x, y: y, width: width, height: height));
        label.backgroundColor=UIColor.clear;
        label.textColor=UIColor.black;
        
        if(fontName == nil)
        {
            label.font=UIFont(name:AppConstants.APPLE_SD_GOTHIC_BOLD,size:CGFloat(fontSize));
        }
        else
        {
            label.font=UIFont(name:fontName!,size:CGFloat(fontSize));
        }
        
        label.text=text;
        
        if(numberOfLines<=0)
        {
            label.numberOfLines=0;
            label.sizeToFit();
        }
        else
        {
            label.numberOfLines=numberOfLines;
        }
        
        return label;
    }
    
    class func standardTextField(text:String?,placeHolderText:String?,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat, fontName:String?,fontSize:CGFloat,delegate:UITextFieldDelegate?)->UITextField
    {
        
        let textField:UITextField=UITextField(frame:CGRect(x: x,y: y,width: width,height: height));
        textField.text=text;
        textField.font=UIFont(name:(fontName != nil ? fontName! : AppConstants.APPLE_SD_GOTHIC_REGULAR),size:fontSize);
        textField.textColor=UIColor.black;
        textField.autocorrectionType=UITextAutocorrectionType.no;
        textField.placeholder=placeHolderText;
        textField.backgroundColor=UIColor.clear;
        textField.borderStyle=UITextField.BorderStyle.roundedRect;
        textField.delegate=delegate;
        
        return textField;
    }
    
    class func standardImageView(imageName:String,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat)->UIImageView
    {
        let image=UIImage(named:imageName)
        let imageWidth=image?.size.width
        let imageHeight=image?.size.height
        
        let imageView=UIImageView()
        
        if((width<=0 && height<=0))
        {
            imageView.frame=CGRect(x: x, y: y, width: imageWidth!, height: imageHeight!)
        }
        else if(width<=0)
        {
            imageView.frame=CGRect(x: x, y: y, width: imageWidth!, height: height)
        }
        else if(height<=0)
        {
            imageView.frame=CGRect(x: x, y: y, width: width, height: imageHeight!)
        }
        else
        {
            imageView.frame=CGRect(x: x, y: y, width: width, height: height)
        }
        
        imageView.image=image
        
        return imageView
    }
    
    class func standardImageView_With_Image(image:UIImage,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat)->UIImageView
    {
        let imageWidth=image.size.width
        let imageHeight=image.size.height
        
        let imageView=UIImageView()
        
        if((width<=0 && height<=0))
        {
            imageView.frame=CGRect(x: x, y: y, width: imageWidth, height: imageHeight)
        }
        else if(width<=0)
        {
            imageView.frame=CGRect(x: x, y: y, width: imageWidth, height: height)
        }
        else if(height<=0)
        {
            imageView.frame=CGRect(x: x, y: y, width: width, height: imageHeight)
        }
        else
        {
            imageView.frame=CGRect(x: x, y: y, width: width, height: height)
        }
        
        imageView.image=image
        
        return imageView
    }
    
    class func lineView(orientation:AppConstants.LineViewOrientation, color:UIColor?, x:CGFloat,y:CGFloat, length:CGFloat,thickness:CGFloat)->UIView
    {
        let lineView=UIView()
        
        if(orientation==AppConstants.LineViewOrientation.Horizontal)
        {
            lineView.frame=CGRect(x: x, y: y, width: length, height: thickness)
        }
        else if(orientation==AppConstants.LineViewOrientation.Vertical)
        {
            lineView.frame=CGRect(x: x, y: y, width: thickness, height: length)
        }
        
        if(color == nil)
        {
            lineView.backgroundColor=UIColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha:1.0)
        }
        else
        {
            lineView.backgroundColor=color!
        }
        
        return lineView
    }
    
    class func standardButton(title:String,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bgcolor:UIColor?,fontName:String?, fontSize:Int,titleColor:UIColor?, enableRoundedCorners:Bool?, target:AnyObject?, action:Selector?)->UIButton
    {
        
        let button=UIButton(frame: CGRect(x: x,y: y,width: width,height: height))
        button.setTitle(title, for: UIControl.State.normal)
        
        if(enableRoundedCorners == nil || enableRoundedCorners == true)
        {
            button.layer.cornerRadius=CGFloat(18)
        }
        
        if(target != nil && action != nil)
        {
            button.addTarget(target!, action: action!, for: UIControl.Event.touchUpInside)
        }
        
        if(fontName==nil)
        {
            button.titleLabel!.font=UIFont(name:AppConstants.APPLE_SD_GOTHIC_REGULAR, size:CGFloat(fontSize));
        }
        else
        {
            button.titleLabel!.font=UIFont(name:fontName!,size:CGFloat(fontSize));
        }
        
        if(bgcolor==nil)
        {
            button.backgroundColor=UIColor.white
        }
        else
        {
            button.backgroundColor=bgcolor!
        }
        
        if(titleColor == nil)
        {
            button.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        }
        else
        {
            button.setTitleColor(titleColor, for: UIControl.State.normal)
        }
        
        return button
    }
    
    
    class func standardButton_CurveEdge(title:String,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bgcolor:UIColor?,fontName:String?, fontSize:Int,titleColor:UIColor?, enableRoundedCorners:Bool?, target:AnyObject?, action:Selector?)->UIButton
    {
        
        let button=UIButton(frame: CGRect(x: x,y: y,width: width,height: height))
        button.setTitle(title, for: UIControl.State.normal)
        
        if(enableRoundedCorners == nil || enableRoundedCorners == true)
        {
            button.layer.cornerRadius=CGFloat(5)
        }
        
        if(target != nil && action != nil)
        {
            button.addTarget(target!, action: action!, for: UIControl.Event.touchUpInside)
        }
        
        if(fontName==nil)
        {
            button.titleLabel!.font=UIFont(name:AppConstants.APPLE_SD_GOTHIC_REGULAR, size:CGFloat(fontSize));
        }
        else
        {
            button.titleLabel!.font=UIFont(name:fontName!,size:CGFloat(fontSize));
        }
        
        if(bgcolor==nil)
        {
            button.backgroundColor=UIColor.white
        }
        else
        {
            button.backgroundColor=bgcolor!
        }
        
        if(titleColor == nil)
        {
            button.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        }
        else
        {
            button.setTitleColor(titleColor, for: UIControl.State.normal)
        }
        
        return button
    }
    
    class func standardUIAlertController(title: String, message: String, preferredStyle: UIAlertController.Style?)->UIAlertController
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle != nil ? preferredStyle! : .alert)
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction);
        
        return alertController;
    }
    
    class func standardUISwitch(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,onTintColor:UIColor?)->UISwitch
    {
        let switchButton:UISwitch=UISwitch(frame: CGRect(x: x, y: y, width: width, height: height))
        
        if(onTintColor == nil)
        {
            switchButton.onTintColor=AppConstants.COLOR_2
        }
        else
        {
            switchButton.onTintColor=onTintColor
        }
        
        return switchButton
    }
    class func standardTextView(text:String?,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat, fontName:String?,fontSize:CGFloat)->UITextView
    {
        
        let textView:UITextView=UITextView(frame:CGRect(x: x,y: y,width: width,height: height));
        textView.text=text;
        textView.font=UIFont(name:(fontName != nil ? fontName! : AppConstants.APPLE_SD_GOTHIC_REGULAR),size:fontSize);
        textView.textColor=UIColor.black;
        textView.autocorrectionType=UITextAutocorrectionType.no;
        textView.backgroundColor=UIColor.clear;
        
        return textView;
    }
    
    class func standardTextField_custom_underline(text:String?, placeholder:String?, x:CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, fontSize: CGFloat, requirePadding : Bool) -> UITextField{
        
        let textField = UITextField(frame: CGRect(x: x,
                                                  y: y,
                                                  width: width,
                                                  height: height));
        textField.textColor = UIColor.black;
        if(placeholder != nil){
            textField.placeholder = placeholder;
        }
        
        if(text != nil){
            textField.text = text;
        }
        
        textField.font = UIFont(name: AppConstants.POPPINS_REGULAR, size: fontSize)
        
        let border = CALayer()
        let width = CGFloat(0.75)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        if(requirePadding){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.height));
            textField.leftView = paddingView
            textField.leftViewMode = UITextField.ViewMode.always
        }
        return textField;
    }
    
    class func customRadioButton(text:String?, placeholder:String?, x:CGFloat, y: CGFloat, target:AnyObject?, action:Selector?) -> UIButton
    {
        
        let button = UIButton(frame: CGRect(x: x,y: y,width: 20,height: 20))
        
        if(target != nil && action != nil)
        {
            button.addTarget(target!, action: action!, for: UIControl.Event.touchUpInside)
        }
        
        button.backgroundColor=UIColor.white
        button.layer.borderColor = AppConstants.COLOR_1.cgColor;
        button.layer.borderWidth = 2;
        button.layer.cornerRadius = 11;
        return button;
    }
    
}
