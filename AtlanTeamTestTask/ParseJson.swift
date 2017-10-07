//
//  ParseJson.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 06.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var resource = [Resources]()


// functions for parsing json
typealias downloadNewsCompletion = () -> Void

func downloadNews(category: String, completion: @escaping (_ success: Bool) -> Void) -> [Resources] {
    
    
    
    Alamofire.request(Router.getResource(category: category)).responseJSON { response in
        
        switch response.result {
        case .success(let rawJson):
            return resource = parseNewsFromJson(rawJson: rawJson) //{
                //resource = newsArrayFromJson
                //print(newsArray)
           // }
            //completion(true)
            
        case .failure(let error):
            print(error)
        }
    }
    
    return resource
}

private func parseNewsFromJson(rawJson: Any) -> [Resources] {
    let json = JSON(rawJson)
    //print(json)
    var newsArray = [Resources]()
    for (_, subJson):(String, JSON) in json {
        
        if  let addNews = Resources(subJson) {
            newsArray.append(addNews)
            print(newsArray)
        }
        
    }
    
    return newsArray
}


