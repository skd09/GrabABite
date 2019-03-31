//
//  BaseBO.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation

class BaseBO
{
    var statusCode : String?;
    var statusMsg : String?;
    var data : Dictionary<String,AnyObject>!;
    var userToken:UserToken?;
    
    class func prepareBaseBOWithParameters(parameters:AnyObject?...)->AnyObject?
    {
        return nil;
    }
    
    func paramName()->String?
    {
        return nil;
    }
    
    func parameters()->AnyObject?
    {
        return nil;
    }
    
    func parse(parameter:AnyObject)
    {
        
    }
}

struct UserToken
{
    var isTokenValidated:Bool?;
    var tokenId:String?;
    var tokenStatus:String?;
    
    init(isTokenValidated:Bool?, tokenId:String?, tokenStatus:String?)
    {
        self.isTokenValidated = isTokenValidated;
        self.tokenId = tokenId;
        self.tokenStatus = tokenStatus;
    }
}
