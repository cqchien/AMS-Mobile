//
//  INFO_ViewController.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 28/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

// Demo new screen 

class INFO_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var Class: UIImageView!
    
    @IBOutlet weak var logOut: UIImageView!
    
    @IBOutlet weak var userInfo: UIImageView!
    
    let info = [UserDefaults.standard.string(forKey: "name"), UserDefaults.standard.string(forKey: "studentCode"), UserDefaults.standard.string(forKey: "mainClass"),UserDefaults.standard.string(forKey: "email")]
    
    let arr_title = ["user", "id", "class", "mail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTable.delegate = self
        myTable.dataSource = self
        self.myTable.rowHeight = self.myTable.frame.size.height/5.5
        self.navigationController?.isNavigationBarHidden = true
        myTable.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // 4 lines of infor: name, student number, class, email
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = myTable.dequeueReusableCell(withIdentifier: "INFO") as! INFO_TableViewCell
        line.icon.image = UIImage(named: arr_title[indexPath.row])
        line.lbl_content.text = info[indexPath.row]
        return line
    }

    @IBAction func openClass(_ sender: Any) {
    }
    
    @IBAction func logOut(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

