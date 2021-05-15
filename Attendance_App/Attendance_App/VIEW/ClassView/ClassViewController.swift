//
//  ClassViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var TVClass: UITableView!
    //var courses =  [UserDefaults.standard.string(forKey: "courseCode") ?? ""]
    var name = ["Nguyễn Hữu Toàn", "Đặng Quang Hưng", "Cao Quyết Chiến", "Đỗ Hoàng Hiệp"]
    var room = ["E4.1", "C101", "C202", "B4.02"]
    var attendance = ["7/7", "7/7", "7/7", "7/7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetClassInfo()
        
        TVClass.delegate = self
        TVClass.dataSource = self
        
        TVClass.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.TVClass.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellClass
        
        
        let darius = cell.roundView.frame.height/5
        cell.roundView.layer.cornerRadius = darius

        
        //cell.courseCode.text = self.courses[indexPath.row]
        cell.nameTeacher.text = self.name[indexPath.row]
        cell.room.text = self.room[indexPath.row]
        cell.Attendance.text = self.attendance[indexPath.row]
        
        return cell;
    }

}
