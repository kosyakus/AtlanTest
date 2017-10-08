//
//  PostsTableViewController.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 06.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostsTableViewController: UITableViewController {
    
    let url = "https://jsonplaceholder.typicode.com/"
    //var resource = [Resources]()
    var posts = [Posts]()
    var comments = [Comments]()
    var users = [Users]()
    var photos = [Photos]()
    var todos = [Todos]()
    
    
    // functions for parsing json
    typealias downloadNewsCompletion = () -> Void
    
    func downloadNews(category: String, completion: @escaping (_ success: Bool) -> Void) {
        
        Alamofire.request("\(url + category)").responseJSON { [weak self] response in
            
            switch response.result {
            case .success(let rawJson):
                let json = JSON(rawJson)
                for subJson in json[].arrayValue {
                    switch category {
                    case "posts":
                        if  let addNews = Posts(subJson) {
                            self?.posts.append(addNews)
                            print(self?.posts as Any)
                        }
                    case "comments":
                        if  let addNews = Comments(subJson) {
                            self?.comments.append(addNews)
                            print(self?.comments as Any)
                        }
                    case "users":
                        if  let addNews = Users(subJson) {
                            self?.users.append(addNews)
                            print(self?.users as Any)
                        }
                    case "photos":
                        if  let addNews = Photos(subJson) {
                            self?.photos.append(addNews)
                            print(self?.photos as Any)
                        }
                    case "todos":
                        if  let addNews = Todos(subJson) {
                            self?.todos.append(addNews)
                            print(self?.todos as Any)
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
                DispatchQueue.main.async() {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    /*
    private func parseNewsFromJson(rawJson: Any) -> [Posts] {
        let json = JSON(rawJson)
        //print(json)
        /*var postsArray = [Posts]()
        var commArray = [Comments]()
        var usersArray = [Users]()
        var photosArray = [Photos]()
        var todosArray = [Todos]()*/
        for subJson in json[].arrayValue {
            
            if  let addNews = Posts(subJson) {
                posts.append(addNews)
                print(posts)
            }
            
        }
        
        return posts
    }*/

    
    var cardIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch cardIndex {
        case 0:
            downloadNews(category: "posts") { (success) in
                if success {
                    print("success")
                    print(self.posts)
                }
            }
        case 1:
            downloadNews(category: "comments") { (success) in
                if success {
                    print("success")
                    //print(self.resource)
                }
            }
        case 2:
            downloadNews(category: "users") { (success) in
                if success {
                    print("success")
                    //print(self.resource)
                }
            }
        case 3:
            downloadNews(category: "photos") { (success) in
                if success {
                    print("success")
                    //print(self.resource)
                }
            }
        case 4:
            downloadNews(category: "todos") { (success) in
                if success {
                    print("success")
                    //print(self.resource)
                }
            }
        default:
            print("invalid card index")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cardIndex {
        case 0:
            return posts.count
        case 1:
            return comments.count
        case 2:
            return users.count
        case 3:
            return photos.count
        case 4:
            return todos.count
        default:
            return 1
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        
        switch cardIndex {
        case 0:
            let title = posts[indexPath.row]
            cell.textLabel?.text = title.postTytle
            cell.detailTextLabel?.text = String(describing: title.postID)
        case 1:
            let title = comments[indexPath.row]
            cell.textLabel?.text = title.comment
        case 2:
            let title = users[indexPath.row]
            cell.textLabel?.text = title.userName
            cell.detailTextLabel?.text = title.userCompany
        case 3:
            let title = photos[indexPath.row]
            let imgURL:URL = URL(string: title.photo)!
            let imgData = try! Data(contentsOf: imgURL)
            cell.imageView?.image = UIImage(data: imgData)
        case 4:
            let title = todos[indexPath.row]
            cell.textLabel?.text = title.taskResult
        default:
            break
        }
        
        //let title = posts[indexPath.row]

        /*cell.textLabel?.text = title.postTytle
        cell.detailTextLabel?.text = String(describing: title.postID)*/

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }

}
