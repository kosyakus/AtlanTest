//
//  Posts.swift
//  
//
//  Created by Admin on 08.10.17.
//

import Foundation
import SwiftyJSON

class Posts {
    
    dynamic var postID: Int = 0
    dynamic var postTytle: String = ""
    
    convenience init?(_ json: JSON) {
        
        guard
            let postID = json["id"].int,
            let postTytle = json["title"].string
        
            else { return nil }
        
        self.init()
        self.postID = postID
        self.postTytle = postTytle
       
    }
    
    
}
