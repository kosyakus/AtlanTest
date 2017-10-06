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




// functions for parsing json
typealias downloadNewsCompletion = () -> Void

func downloadNews(category: String, completion: @escaping (_ success: Bool) -> Void) {
    
    var resource = [Resources]()
    
    Alamofire.request(Router.getResource(category: category)).responseJSON { response in
        
        switch response.result {
        case .success(let rawJson):
            resource = parseNewsFromJson(rawJson: rawJson) //{
                //resource = newsArrayFromJson
                //print(newsArray)
           // }
            completion(true)
            
        case .failure(let error):
            print(error)
        }
    }
}

private func parseNewsFromJson(rawJson: Any) -> [Resources] {
    let json = JSON(rawJson)
    //print(json)
    var newsArray = [Resources]()
    for (_, subJson):(String, JSON) in json {
        
        if  let addNews = Resources(subJson) {
            newsArray.append(addNews)
            //print(newsArray)
        }
        
    }
    
    return newsArray
}
