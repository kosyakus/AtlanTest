//
//  Resources.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 06.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import Foundation
import SwiftyJSON

class Resources {
    
    dynamic var postID: Int = 0
    dynamic var postTytle: String = ""
    
    dynamic var comment: String = ""
    
    dynamic var userName: String = ""
    dynamic var userCity: String = ""
    dynamic var userCompany: String = ""
    
    dynamic var photo: String = ""
    
    dynamic var taskResult: Bool = true
    
    
    
    convenience init?(_ json: JSON) {
        
        guard
            let postID = json["id"].int ?? 0,
            let postTytle = json["title"].string ?? "",
            let comment = json["body"].string ?? "",
            let userName = json["name"].string ?? "",
            let userCity = json["address"]["city"].string ?? "",
            let userCompany = json["company"]["name"].string ?? "",
            let photo = json["url"].string ?? "",
            let taskResult = json["completed"].bool ?? true
            
            else { return nil }
        
        self.init()
        self.postID = postID
        self.postTytle = postTytle
        self.comment = comment
        self.userName = userName
        self.userCity = userCity
        self.userCompany = userCompany
        self.photo = photo
        self.taskResult = taskResult
        
    }
    
   
}
