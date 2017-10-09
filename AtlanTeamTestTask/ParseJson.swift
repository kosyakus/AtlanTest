//
//  ParseJson.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 09.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let url = "https://jsonplaceholder.typicode.com/"
var posts = [Posts]()
var comments = [Comments]()
var users = [Users]()
var photos = [Photos]()
var todos = [Todos]()


// functions for parsing json
typealias downloadNewsCompletion = () -> Void

func downloadNews(category: String, completion: @escaping (_ success: Bool) -> Void) {
    
    Alamofire.request("\(url + category)").responseJSON { response in
        
        switch response.result {
        case .success(let rawJson):
            let json = JSON(rawJson)
            for subJson in json[].arrayValue {
                switch category {
                case "posts":
                    if  let addNews = Posts(subJson) {
                        posts.append(addNews)
                        //print(posts as Any)
                    }
                case "comments":
                    if  let addNews = Comments(subJson) {
                        comments.append(addNews)
                        //print(comments as Any)
                    }
                case "users":
                    if  let addNews = Users(subJson) {
                        users.append(addNews)
                        //print(users as Any)
                    }
                case "photos":
                    if  let addNews = Photos(subJson) {
                        photos.append(addNews)
                        //print(photos as Any)
                    }
                case "todos":
                    if  let addNews = Todos(subJson) {
                        todos.append(addNews)
                        //print(todos as Any)
                    }
                default: break
                }
                
                
            }
            
            //self?.posts = (self?.parseNewsFromJson(rawJson: rawJson))!
            /*if let someRes = self?.parseNewsFromJson(rawJson: rawJson) {
             switch category {
             case "posts":
             self?.posts = someRes
             case "comments":
             self?.comments = someRes
             default: break
             }
             
             }*/
            completion(true)
            
        case .failure(let error):
            print(error)
        }
    }
    
}
