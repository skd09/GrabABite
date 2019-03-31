//
//  ServerErrorBO.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import UIKit

class ServerErrorBO: BaseBO {
    var isSessionExpired : Bool = false;
    var errorText : String? = nil;
    
    init(errorText : String) {
        self.errorText = errorText;
    }
    
    class func serverErrorBO_From_OneOfTheValidTexts(possibleTexts : AnyObject?...)-> ServerErrorBO
    {
        let serverErrorBO : ServerErrorBO = ServerErrorBO(errorText:"Server Error");
        for object in possibleTexts
        {
            if(object != nil && (object as? String) != nil)
            {
                serverErrorBO.errorText = (object as? String);
            }
        }
        return serverErrorBO;
    }
}

