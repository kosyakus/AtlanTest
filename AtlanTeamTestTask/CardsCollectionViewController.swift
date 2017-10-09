//
//  CardsCollectionViewController.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 06.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Card"

class CardsCollectionViewController: UICollectionViewController {
    
    
    
    
    let icon = [UIImage(named: "post"), UIImage(named: "comment"), UIImage(named: "users"), UIImage(named: "photos"), UIImage(named: "todo")]
    let array = ["posts", "comments", "users", "photos", "todos"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in array {
            downloadNews(category: i) { (success) in
                if success {
                    print("success")
                }
            }
        }
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return icon.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //self.collectionView?.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
    
        cell.backgroundColor = UIColor.white
        
        cell.image.image =  icon[indexPath.row]
    
        return cell
    }
    
    
    
    
     // MARK: - Navigation
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        
        if segue.identifier == "toShow" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as!PostsTableViewController
                        
            let indexPath = collectionView?.indexPath(for: sender as! UICollectionViewCell)
            controller.cardIndex = (indexPath?.row)!
            print(controller.cardIndex)
              
            }
     
    } */
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 */
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewController = UIStoryboard.instantiate(storyboardName: "PostsTableViewController")
        //viewController.parametrs = parametrs
        //self.present(viewController, animated: true, completion: nil)
        self.navigationController?.show(viewController, sender: nil)
    }*/
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)//главный сториборд
        var identifier = ""
        
        if indexPath.item == 0 {
            identifier = "PostsTableViewController"
            //navigationController?.pushViewController(AllResultsTableViewController, animated: true)
        }
        if indexPath.item == 1 {
            identifier = "CommentsTableViewController"
        }
        if indexPath.item == 2 {
            identifier = "UserTableViewController"
        }
        if indexPath.item == 3 {
            identifier = "PhotoViewController"
        }
        if indexPath.item == 4 {
            identifier = "TodoViewController"
        }
        let AllResultsTableViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier)
        self.present(AllResultsTableViewController, animated: true, completion: nil)
        print("You selected cell \(indexPath.item)!")
        
    }

  /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        //let indexPath = indexPath.row
        if indexPath.row == 0 {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)//главный сториборд
            let AllResultsTableViewController = mainStoryboard.instantiateViewController(withIdentifier: "PostsTableViewController")//View в который нужен переход
            navigationController?.pushViewController(AllResultsTableViewController, animated: true)
        }
    
    }*/
    
    
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

}


extension CardsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    
    //is responsible for telling the layout the size of a given cell
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //returns the spacing between the cells, headers, and footers
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // controls the spacing between each line in the layout. match the padding at the left and right.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    class func instantiate<T: UIViewController>(storyboardName: String) -> T {
        let identifier = String(describing: T.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError()
        }
        return viewController
    }
}
