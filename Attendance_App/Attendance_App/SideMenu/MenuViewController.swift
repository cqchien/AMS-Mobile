//
//  MenuViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/24/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
   
    var data = [ClassDto]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        dismiss(animated: true)
    }
}
