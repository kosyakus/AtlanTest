//
//  Photos.swift
//  
//
//  Created by Admin on 08.10.17.
//

import Foundation
import SwiftyJSON

class Photos {
    
    dynamic var photo: String = ""
    
    convenience init?(_ json: JSON) {
        
        guard
            let photo = json["url"].string
        
            else { return nil }
        
        self.init()
        self.photo = photo
        
    }
    
    
}
