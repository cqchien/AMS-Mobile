//
//  ClassViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var data = [ClassDto]()
    
    @IBOutlet weak var TVClass: UITableView!
    
    var attendance = ["7/7", "7/7", "6/7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetClassInfo{
            data in
            self.data = data
            DispatchQueue.main.async {
                self.TVClass.reloadData()
            }
        }
        
        TVClass.delegate = self
        TVClass.dataSource = self
        // Hide table view cell line
        TVClass.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Table view

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.TVClass.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellClass
        
        // Create radius for view
        let darius = cell.roundView.frame.height/5
        cell.roundView.layer.cornerRadius = darius

        
        cell.courseCode.text = data[indexPath.row].courseCode
        cell.nameTeacher.text = self.data[indexPath.row].endTime
        cell.room.text = self.data[indexPath.row].room
        cell.Attendance.text = self.attendance[indexPath.row]
        
        return cell;
    }

   
}
