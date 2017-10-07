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
    var resource = [Resources]()
    
    
    // functions for parsing json
    typealias downloadNewsCompletion = () -> Void
    
    func downloadNews(category: String, completion: @escaping (_ success: Bool) -> Void) {
        
        Alamofire.request("\(url + category)").responseJSON { [weak self] response in
            
            switch response.result {
            case .success(let rawJson):
                if let someRes = self?.parseNewsFromJson(rawJson: rawJson) {
                    self?.resource = someRes
                    //print(self?.resource)
                }
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
                print(newsArray)
            }
            
        }
        
        return newsArray
    }

    
    var cardIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch cardIndex {
        case 0:
            downloadNews(category: "posts") { (success) in
                if success {
                    print("success")
                    print(self.resource)
                }
            }
        case 1:
            downloadNews(category: "comments") { (success) in
                if success {
                    print("success")
                    print(self.resource)
                }
            }
        case 2:
            downloadNews(category: "users") { (success) in
                if success {
                    print("success")
                    print(self.resource)
                }
            }
        case 3:
            downloadNews(category: "photos") { (success) in
                if success {
                    print("success")
                    print(self.resource)
                }
            }
        case 4:
            downloadNews(category: "todos") { (success) in
                if success {
                    print("success")
                    print(self.resource)
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
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        
        //let title = resources[indexPath.row]

        //cell.textLabel?.text = String(describing: resource[indexPath.row])
        //cell.detailTextLabel?.text = title.postTytle

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

}
