//
//  UserInfo_ViewController.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 16/May/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class UserInfo_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var finishedClass: UIImageView!
    
    
    @IBOutlet weak var logOut: UIImageView!
    
    @IBOutlet weak var user: UIImageView!
    
    let info = [UserDefaults.standard.string(forKey: "name"), UserDefaults.standard.string(forKey: "studentCode"), UserDefaults.standard.string(forKey: "mainClass"),UserDefaults.standard.string(forKey: "email")]
    
    let arr_title = ["user-4", "id", "class", "mail"]
    override func viewDidLoad() {
        super.viewDidLoad()
        GetUserInfo()
        myTable.delegate = self
        myTable.dataSource = self
        self.myTable.rowHeight = self.myTable.frame.size.height/4.5
        self.navigationController?.isNavigationBarHidden = true
        myTable.tableFooterView = UIView()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = myTable.dequeueReusableCell(withIdentifier: "INFO") as! INFO_TableViewCell
        line.icon.image = UIImage(named: arr_title[indexPath.row])
        line.lbl_content.text = info[indexPath.row]
        return line
    }

}