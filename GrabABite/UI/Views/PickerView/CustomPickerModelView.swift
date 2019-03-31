//
//  CustomPickerModelView.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import UIKit
import SwiftDate

class CustomPickerModelView: BaseModelView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var dataArray = [Array<String>()]
    private var selectedValue:String!
    private var titleString:String?
    private var doneButton: UIButton!
    private var cancelButton: UIButton!
    private var containerView: UIView!
    private var pickerView:UIPickerView!
    
    init(baseModelViewDelegate:BaseModelViewDelegate?, title:String?, dataArray:[Array<String>])
    {
        super.init(baseModelViewDelegate: baseModelViewDelegate);
        self.titleString=title;
        self.dataArray = dataArray
        self.selectedValue = dataArray[0][0]
        self.prepareDataPicker()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func modalViewDidShow()
    {
        // self.prepareDataPicker()
    }
    
    override func dimissPositiveCallBack()->Void
    {
        self.baseModelViewDelegate?.baseModelViewDelegate_PositiveAction(baseViewModel: self,
                                                                         parameters: self.selectedValue as AnyObject);
    }
    
    //MARK: UIPickerView DataSource Methods
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return dataArray[component].count
    }
    
    //MARK: UIPickerView Delegate Methods
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return dataArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selectedValue = dataArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: AppConstants.HELVETICA_NEUE_BOLD, size: 16)
            pickerLabel?.textAlignment = .center
            pickerLabel?.numberOfLines = 3;
        }
        pickerLabel?.text = dataArray[component][row]
        
        return pickerLabel!
    }
    
    //MARK: Internal Methods
    
    @objc func doneButtonTapped()
    {
        super.dimissPositive();
    }
    
    @objc func cancelButtonTapped()
    {
        super.dimissNegative();
    }
    
    //MARK: Private Methods
    
    private func prepareDataPicker()
    {
        var theY:CGFloat = 0.0;
        
        self.containerView = UIView(frame: CGRect(x:0, y:0, width:(self.frame.size.width), height:self.frame.size.height))
        self.containerView.backgroundColor = UIColor.white
        self.containerView.layer.borderColor = AppConstants.COLOR_2.cgColor;
        self.containerView.layer.borderWidth = 1;
        self.containerView.layer.cornerRadius = 5;
        self.addSubview(containerView)
        
        if(titleString != nil)
        {
            // Adding titleLabel above the dataPickerView
            
            let titleLabel = UIUtil.standardLabel(text: self.titleString!, x: AppConstants.PADDING_10, y: AppConstants.PADDING_10,
                                                  width: (containerView.frame.size.width - 2*AppConstants.PADDING_10),
                                                  height: 0,
                                                  numberOfLines: 0,
                                                  fontName: AppConstants.HELVETICA_NEUE,
                                                  fontSize: 16)
            titleLabel.textAlignment = .center;
            titleLabel.textColor = AppConstants.COLOR_1;
            titleLabel.frame.origin.x = (containerView.frame.size.width - titleLabel.frame.size.width)/2
            self.containerView.addSubview(titleLabel);
            
            theY = titleLabel.frame.size.height + AppConstants.PADDING_5;
        }
        
        pickerView = UIPickerView(frame: CGRect.zero)
        pickerView.frame = CGRect(x:0,y:theY + 10, width:containerView.frame.size.width, height:pickerView.frame.size.height)
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(1, inComponent: 0, animated: true)
        self.containerView.addSubview(pickerView)
        
        // Adding Done button
        doneButton = UIUtil.standardButton(title: "Done",
                                           x: AppConstants.PADDING_10,
                                           y: (pickerView.frame.origin.y + pickerView.frame.size.height) + 10,
                                           width: self.containerView.frame.width/2 - 10,//(self.containerView.frame.size.width - 2 * AppConstants.PADDING_10),
            height: 50,
            bgcolor: AppConstants.COLOR_1,
            fontName: AppConstants.HELVETICA_NEUE,
            fontSize: 16,
            titleColor: UIColor.white,
            enableRoundedCorners: true,
            target: self,
            action: #selector(CustomPickerModelView.doneButtonTapped))
        doneButton .layer.cornerRadius = 27;
        self.containerView.addSubview(doneButton)
        
        // Adding Cancel button
        cancelButton = UIUtil.standardButton(title: "Cancel",
                                             x: doneButton.frame.maxX + 20,//(AppConstants.PADDING_10),
            y: (pickerView.frame.origin.y + pickerView.frame.size.height) + 5,
            width: self.containerView.frame.width/2 - 20*2,//(self.containerView.frame.size.width - 2 * AppConstants.PADDING_10),
            height: 50,
            bgcolor: nil,
            fontName: AppConstants.HELVETICA_NEUE,
            fontSize: 16,
            titleColor: AppConstants.COLOR_1,
            enableRoundedCorners: true,
            target: self,
            action: #selector(CustomPickerModelView.cancelButtonTapped))
        cancelButton.layer.borderColor = AppConstants.COLOR_1.cgColor
        cancelButton.layer.cornerRadius = 27;
        cancelButton.layer.borderWidth = 1
        self.containerView.addSubview(cancelButton)
        
        // Resize and Reposition ContainerView
        containerView.frame.size.height = ( pickerView.frame.origin.y + pickerView.frame.size.height + AppConstants.PADDING_10 + doneButton.frame.size.height + AppConstants.PADDING_10 + cancelButton.frame.size.height)
        
        containerView.frame.origin.y = self.frame.size.height - containerView.frame.size.height
        
    }
    
    public func setPickerValue(position: Int){
        self.pickerView.selectRow(position, inComponent: 0, animated: true);
    }
}
