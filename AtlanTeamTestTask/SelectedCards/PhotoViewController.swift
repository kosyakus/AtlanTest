//
//  PhotoViewController.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 09.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo #3"
        
        let url = photos[2].photo

        let imgURL:URL = URL(string: url)!
        let imgData = try! Data(contentsOf: imgURL)
        imageView?.image = UIImage(data: imgData)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

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
