//
//  CustomSalutationView.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 10/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import UIKit

protocol CustomSalutationViewDelegate {
    func customSalutationView_DidSelectIndex(customSaltutationView: CustomSalutationView, index:Int);
}

class CustomSalutationView: UIView {
    
    var customSaltutationViewDelegate : CustomSalutationViewDelegate?;
    //private var button : UIButton?;
    private var textArray : Array<String>!;
    private var activeIndicator: UIView!;
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init not been implemented.");
    }
    
    init(frame: CGRect, textArray: Array<String>) {
        super.init(frame: frame);
        self.textArray = textArray;
        
        prepareAndAdd_View();
    }
    
    private func prepareAndAdd_View(){
        
        let buttonWidth = (self.frame.size.width)/CGFloat(self.textArray.count);
        var theX : CGFloat = 0;
        
        self.activeIndicator = UIUtil.lineView(orientation: .Horizontal,
                                               color: AppConstants.COLOR_1,
                                               x: theX,
                                               y: 0,
                                               length: buttonWidth,
                                               thickness:self.frame.size.height - 2);
        self.addSubview(self.activeIndicator);
        
        for(index,item) in self.textArray.enumerated(){
            
            let button = UIUtil.standardButton(title: item,
                                               x: theX,
                                               y: 0,
                                               width: buttonWidth,
                                               height: self.frame.size.height - 2,
                                               bgcolor: UIColor.clear,
                                               fontName: AppConstants.POPPINS_REGULAR,
                                               fontSize: 15,
                                               titleColor: UIColor.black,
                                               enableRoundedCorners: false,
                                               target: self,
                                               action: #selector(CustomSalutationView.onCustomButtonClick(sender:)));
            button.layer.borderColor = AppConstants.COLOR_1.cgColor;
            button.layer.borderWidth = 1;
            button.tag = index;
            self.addSubview(button);
            
            theX += button.frame.size.width;
            
            
        }
    }
    
    @objc func onCustomButtonClick(sender: UIButton){
        UIView.animate(withDuration: 0.1, animations:{
            self.activeIndicator.frame.origin.x = sender.frame.origin.x;
        });
        self.customSaltutationViewDelegate?.customSalutationView_DidSelectIndex(customSaltutationView: self, index: sender.tag);
    }
    
}
