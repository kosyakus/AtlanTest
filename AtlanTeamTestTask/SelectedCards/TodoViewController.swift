//
//  TodoViewController.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 09.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var labelTexto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomTask = Int(arc4random_uniform(UInt32(todos.count)))
        print("There are \(todos.count) tasks, Selected task is \(randomTask)")

        if todos[randomTask].taskResult == true {
            labelTexto.text = "Completed"
        } else {
            labelTexto.text = "In progress"
        }
        
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
