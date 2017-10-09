//
//  Users.swift
//  
//
//  Created by Admin on 08.10.17.
//

import Foundation
import SwiftyJSON

class Users {
    
    dynamic var userName: String = ""
    dynamic var userCity: String = ""
    dynamic var userCompany: String = ""
    
    convenience init?(_ json: JSON) {
        
        guard
            let userName = json["name"].string,
            let userCity = json["address"]["city"].string,
            let userCompany = json["company"]["name"].string
        
            else { return nil }
        
        self.init()
        self.userName = userName
        self.userCity = userCity
        self.userCompany = userCompany
        
    }
    
    
}
