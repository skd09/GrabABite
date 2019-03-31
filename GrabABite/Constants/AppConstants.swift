//
//  AppConstants.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import UIKit

class AppConstants : NSObject{
    
    static let COLOR_1 : UIColor = UIColor(red:18.0/255.0,green:26.0/255.0,blue:35.0/255.0,alpha:1.0);  // BlackColor;
    static let COLOR_2:UIColor=UIColor(red: 207.0/255.0,green:208.0/255.0,blue:209.0/255.0,alpha:1.0);  // light gray color
    static let COLOR_3:UIColor=UIColor(red: 0.0/255.0,green:150.0/255.0,blue:136.0/255.0,alpha:1.0);  // Green color
    
    static let PADDING_2 = CGFloat(2.0);
    static let PADDING_5 = CGFloat(5.0);
    static let PADDING_10 = CGFloat(10.0);
    static let PADDING_30 = CGFloat(30.0);
    static let PADDING_45 = CGFloat(45.0);
    
    //fonts
    static let APPLE_SD_GOTHIC_REGULAR = "AppleSDGothicNeo-Regular"
    static let APPLE_SD_GOTHIC_BOLD = "AppleSDGothicNeo-Bold"
    static let HELVETICA_NEUE = "HelveticaNeue"
    static let HELVETICA_NEUE_BOLD = "HelveticaNeue-Bold"
    static let POPPINS = "Poppins"
    static let POPPINS_LIGHT = "Poppins-Light"
    static let POPPINS_MEDIUM = "Poppins-Medium"
    static let POPPINS_SEMI_BOLD = "Poppins-SemiBold"
    static let POPPINS_REGULAR = "Poppins-Regular"
    
    enum LineViewOrientation
    {
        case Horizontal
        case Vertical
    }
}
