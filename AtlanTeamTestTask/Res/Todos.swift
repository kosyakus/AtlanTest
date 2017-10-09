//
//  Todos.swift
//  
//
//  Created by Admin on 08.10.17.
//

import Foundation
import SwiftyJSON

class Todos {
   
    dynamic var taskResult: Bool = true
    
    convenience init?(_ json: JSON) {
        
        guard
            let taskResult = json["completed"].bool
            
            else { return nil }
        
        self.init()
        self.taskResult = taskResult
        
    }
    
    
}
