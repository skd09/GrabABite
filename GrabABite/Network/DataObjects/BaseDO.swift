//
//  BaseDO.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation
import Alamofire
import CryptoSwift

class BaseDO
{
    var request:BaseRequest?;
    var response:BaseResponse?;
    var jsonResponse:AnyObject!;
    var serverErrorBO:ServerErrorBO?=nil;
    
    var tagOfThisDO:Int=0;
    
    func methodType()->DOBOConstants.HTTPMethodType
    {
        return DOBOConstants.HTTPMethodType.Post;
    }
    
    func baseURL()->String?
    {
        return DOBOConstants.BASE_URL_OF_SERVER;
    }
    
    func methodName()->String?
    {
        return nil;
    }
    
    func prepareRequestWithParameters(parameters:AnyObject?...)->Void
    {
        
    }
    
    func requestParameters()->Dictionary<String,AnyObject>?
    {
        return nil;
    }
    
    func accessToken()->String?
    {
        return ""// UserRegistrationHelper.getInstance().getToken();
    }
    
    func encoding()->ParameterEncoding
    {
        return URLEncoding.default;
    }
    
    func queryTheServer(baseDO:@escaping (BaseDO)->Void)->Void
    {
        if(!Connectivity.isConnectedToInternet())
        {
            self.serverErrorBO=ServerErrorBO(errorText: DOBOConstants.ServerError.NetworkUnreachable.rawValue);
            baseDO(self)
        }
        else
        {
            // We have internet connectivity and therefore we can hit the web API.
            
            if(self.methodType() == DOBOConstants.HTTPMethodType.Post)
            {
                print("\nPOST METHOD\n")
                print(self.baseURL()! + self.methodName()!)
                
                var headers = [
                    "cache-control": "no-cache",
                    "Content-Type":"application/json"
                ]
                
                if(self.accessToken() != nil)
                {
                    headers["Authorization"] = "Bearer " + self.accessToken()!;
                }
                
                let request = Alamofire.request((self.baseURL()! + self.methodName()!), method: .post, parameters: self.requestParameters(), encoding: self.encoding(), headers: headers)
                
                // print(request.debugDescription)
                
                request.responseJSON(completionHandler: { (response) in
                    
                    if let JSON = response.result.value
                    {
                        //                        print("\n\n Status Code in BaseDO - \(response.response!.statusCode)");
                        
                        self.jsonResponse=JSON as AnyObject!;
                        
                        if let jsonData = self.jsonResponse as? Dictionary<String,String>
                        {
                            if let errorText = jsonData["error"]
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: errorText);
                                //                                print("Server error - \(self.serverErrorBO!.errorText!)");
                            }
                        }
                        
                        self.parse();
                        baseDO(self)
                    }
                    else
                    {
                        /*
                         This block is called if response.result.value has a 'nil' value, which means the server has returned with some error
                         But this block can also be called in case the statusCode is 200
                         for ex. In case of signing up of a new user
                         This block can also be called if statusCode is 'nil' which might be a case when the network is not reachable.
                         */
                        
                        let statusCode = response.response?.statusCode
                        
                        if(statusCode != nil)
                        {
                            if(statusCode != 200)
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: self.getServerErrorString(statusCode: statusCode!));
                                baseDO(self)
                            }
                            else if(statusCode == 200)
                            {
                                // statusCode is 200 : OK
                                print("Status Code - 200! All OK.. :)")
                                baseDO(self)
                            }
                        }
                        else if(statusCode == nil)
                        {
                            self.serverErrorBO=ServerErrorBO(errorText: "Network not reachable.");
                            baseDO(self)
                        }
                    }
                })
            }
            else if(self.methodType() == DOBOConstants.HTTPMethodType.Put)
            {
                print("\nPUT METHOD\n")
                print(self.baseURL()! + self.methodName()!)
                
                var headers = [
                    "cache-control": "no-cache",
                    "Content-Type":"application/json"
                ]
                
                if(self.accessToken() != nil)
                {
                    headers["Authorization"] = "Bearer " + self.accessToken()!;
                }
                
                let request = Alamofire.request((self.baseURL()! + self.methodName()!), method: .put, parameters: self.requestParameters(), encoding: self.encoding(), headers: headers)
                
                // print(request.debugDescription)
                
                request.responseJSON(completionHandler: { (response) in
                    
                    if let JSON = response.result.value
                    {
                        //                        print("\n\n Status Code in BaseDO - \(response.response!.statusCode)");
                        
                        self.jsonResponse=JSON as AnyObject!;
                        
                        if let jsonData = self.jsonResponse as? Dictionary<String,String>
                        {
                            if let errorText = jsonData["error"]
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: errorText);
                                //                                print("Server error - \(self.serverErrorBO!.errorText!)");
                            }
                        }
                        
                        self.parse();
                        baseDO(self)
                    }
                    else
                    {
                        /*
                         This block is called if response.result.value has a 'nil' value, which means the server has returned with some error
                         But this block can also be called in case the statusCode is 200
                         for ex. In case of signing up of a new user
                         This block can also be called if statusCode is 'nil' which might be a case when the network is not reachable.
                         */
                        
                        let statusCode = response.response?.statusCode
                        
                        if(statusCode != nil)
                        {
                            if(statusCode != 200)
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: self.getServerErrorString(statusCode: statusCode!));
                                baseDO(self)
                            }
                            else if(statusCode == 200)
                            {
                                // statusCode is 200 : OK
                                print("Status Code - 200! All OK.. :)")
                                baseDO(self)
                            }
                        }
                        else if(statusCode == nil)
                        {
                            self.serverErrorBO=ServerErrorBO(errorText: "Network not reachable.");
                            baseDO(self)
                        }
                    }
                })
            }
            else if(self.methodType() == DOBOConstants.HTTPMethodType.Get)
            {
                print("\nGET METHOD\n____________________")
                print(self.baseURL()! + self.methodName()!)
                
                var headers = [
                    "cache-control": "no-cache",
                    "Accept": "application/json",
                    "Content-Type":"application/json"
                ]
                
                if(self.accessToken() != nil)
                {
                    headers["Authorization"] = "Bearer " + self.accessToken()!;
                }
                
                //            print("Headers -\n \(headers)");
                //            print("Parameters - \n \(self.requestParameters())");
                
                Alamofire.request((self.baseURL()! + self.methodName()!), method: .get, parameters: self.requestParameters(), encoding: self.encoding(), headers: headers).responseJSON(completionHandler: { (response) in
                    
                    if let JSON = response.result.value
                    {
                        //                        print("\n\n RESPONSE VALUE IN BASEDO - \(JSON)");
                        
                        self.jsonResponse=JSON as AnyObject!;
                        
                        if let jsonData = self.jsonResponse as? Dictionary<String,String>
                        {
                            if let errorText = jsonData["error"]
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: errorText);
                                print("Server error - \(self.serverErrorBO!.errorText!)");
                            }
                        }
                        
                        self.parse();
                        baseDO(self)
                    }
                    else
                    {
                        /*
                         This block is called if response.result.value has a 'nil' value, which means the server has returned with some error
                         This block can also be called if statusCode is 'nil' which might be a case when the network is not reachable.
                         */
                        
                        let statusCode = response.response?.statusCode
                        
                        if(statusCode != nil)
                        {
                            if(statusCode != 200)
                            {
                                self.serverErrorBO=ServerErrorBO(errorText: self.getServerErrorString(statusCode: statusCode!));
                                baseDO(self)
                            }
                        }
                        else if(statusCode == nil)
                        {
                            self.serverErrorBO=ServerErrorBO(errorText: "Network not reachable.");
                            baseDO(self)
                        }
                    }
                })
            }
        }
    }
    
    func parse()->Void
    {
        
    }
    
    func cancel()->Void
    {
        //        operationManager.operationQueue.cancelAllOperations();
    }
    
    /**
     This method uses AES - 128 bit with Key & IV & PKCS7 padding.
     */
    
//    func encryptData(jsonDict:Dictionary<String,AnyObject>, key:String, iv:String) -> String?
//    {
//        do
//        {
//            let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
//            let jsonDataBytes = jsonData.bytes;
//            
//            let encrypted: Array<UInt8> = try! AES(key: Array(key.utf8),
//                                                   blockMode: .CBC(iv: Array(iv.utf8)),
//                                                   padding: .pkcs7).encrypt(jsonDataBytes)
//            
//            
//            
//            let base64 = encrypted.toBase64();
//            
//            print("base64 - \(base64)");
//            
//            return base64;
//            
//        }
//        catch
//        {
//            print(error.localizedDescription)
//        }
//        
//        return nil;
//    }
//    
//    /**
//     This method uses AES - 128 bit with Key & IV & PKCS7 padding.
//     */
//    
//    func decryptData(base64EncodedString:String, key:String, iv:String)
//    {
//        do
//        {
//            let decryptedBase64String = try! base64EncodedString.decryptBase64ToString(cipher: AES(key: Array(key.utf8), blockMode: .CBC(iv: Array(iv.utf8)), padding: .pkcs7))
//            
//            print("decryptedBase64String - \(decryptedBase64String)")
//        }
//        catch
//        {
//            print(error.localizedDescription)
//        }
//    }
    
    //MARK: Private Methods
    
    private func getServerErrorString(statusCode:Int) ->String
    {
        var errorString:String = "" ;
        
        switch statusCode
        {
        case 400:
            errorString = "The request is missing a required parameter, includes an unsupported parameter value, repeats a parameter or is otherwise malformed";
        case 500:
            errorString = "Unknown error";
        case 601:
            errorString = "Invalid username or password";
        case 701:
            errorString = "No result found";
        default:
            errorString = "OK"
        }
        
        return errorString;
    }
}

class Connectivity
{
    class func isConnectedToInternet() ->Bool
    {
        return NetworkReachabilityManager()!.isReachable
    }
}
