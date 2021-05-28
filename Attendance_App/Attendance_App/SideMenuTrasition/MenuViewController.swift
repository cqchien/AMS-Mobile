//
//  MenuViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/24/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
   

    @IBOutlet var TBMenuView: UITableView!
    
    var data = [ClassDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetClassInfo{
            data in
            self.data = data
            DispatchQueue.main.async {
                self.TBMenuView.reloadData()
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].courseCode
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        dismiss(animated: true)
    }
}
