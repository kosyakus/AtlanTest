//
//  Comments.swift
//  
//
//  Created by Admin on 08.10.17.
//

import Foundation
import SwiftyJSON

class Comments {
   
    dynamic var comment: String = ""
    
    convenience init?(_ json: JSON) {
        
        guard
            let comment = json["body"].string
        
            else { return nil }
        
        self.init()
        self.comment = comment
        
    }
    
    
}
