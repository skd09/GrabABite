//
//  GetCollegeListDO.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import Alamofire

class GetCollegeListDO : BaseDO {
    
    override func methodType() -> DOBOConstants.HTTPMethodType
    {
        return DOBOConstants.HTTPMethodType.Post;
    }
    
    override func methodName()->String?
    {
        return "College/GetCollegeList"
    }
    
    override func encoding() -> ParameterEncoding
    {
        return JSONEncoding.default;
    }
    
    override func prepareRequestWithParameters(parameters: AnyObject?...)
    {
        if(!parameters.isEmpty)
        {
            let getCollegeListRequest:GetCollegeListRequest = GetCollegeListRequest();
            
            
            request = getCollegeListRequest;
        }
    }
    
    override func parse()
    {
        let getCollegeListResponse:GetCollegeListResponse = GetCollegeListResponse()
        getCollegeListResponse.getCollegeListBO = GetCollegeListBO()
        
        print(self.jsonResponse);
        
        if let responseObj=self.jsonResponse as? Dictionary<String,AnyObject>
        {
            let getCollegeListResult = responseObj["CollegeList"] as! Dictionary<String, AnyObject>;
            
            getCollegeListResponse.getCollegeListBO.statusCode = responseObj["statusCode"] as? String;
            getCollegeListResponse.getCollegeListBO.statusMsg = responseObj["statusMsg"] as? String;
            
            if(getCollegeListResponse.getCollegeListBO.statusCode == "0")
            {
                
                getCollegeListResponse.getCollegeListBO.collegeListArray = responseObj["CollegeList"] as? Array;
               
            }
        }
        
        response = getCollegeListResponse;
    }}
