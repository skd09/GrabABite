//
//  DOBOConstants.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

struct DOBOConstants
{
    static let BASE_URL_OF_SERVER : String = "http://127.0.0.1:8081/api/";
    
    enum HTTPMethodType
    {
        case Get
        case Post
        case Put
        case Delete
        case Patch
    }
    
    enum ServerError:String
    {
        case Unauthenticated = "Unauthenticated."
        case NetworkUnreachable = "Network not reachable"
    }
}

