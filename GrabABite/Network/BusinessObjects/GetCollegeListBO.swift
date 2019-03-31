//
//  GetCollegeListBO.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 2019-03-31.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import Foundation

class GetCollegeListBO : BaseBO{
    
    var collegeListArray:Array<CollegeModel>?;
    
}

class CollegeModel{
    
    var CollegeId : Int?;
    var Name : String?;
    var Address : String?;
    var Campus : String?;
    var Contact : String?;
    var isActive : Int?;
    
    init(CollegeId : Int?, Name : String?, Address : String?, Campus : String?, Contact : String?, isActive : Int?) {
        self.CollegeId = CollegeId;
        self.Name = Name;
        self.Address = Address;
        self.Campus = Campus;
        self.Contact = Contact;
        self.isActive = isActive;
    }
}
