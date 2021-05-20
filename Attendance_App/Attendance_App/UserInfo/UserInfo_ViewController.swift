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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var logOut: UIImageView!
    
    @IBOutlet weak var user: UIImageView!
    
    var get = GetUserInfo()
    
    var info:[String] = ["No Information","No Information","No Information","No Information"]
    
    let arr_title = ["user-4", "id", "class", "mail"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        // Call api get user info
        get.GetUserInfo()
        
        _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {  (timer) in
            
            self.get.checkStatus()
            self.spinner.stopAnimating()
            
            if (self.get.status <= 300 && self.get.status != 0) {
                self.info.removeAll()
                self.info.append(UserDefaults.standard.string(forKey: "name")!)
                self.info.append(UserDefaults.standard.string(forKey: "studentCode")!)
                self.info.append(UserDefaults.standard.string(forKey: "mainClass")!)
                self.info.append(UserDefaults.standard.string(forKey: "email")!)
                self.myTable.reloadData()
            }
            else {
                
                let alert = UIAlertController(title: self.get.title, message: self.get.message, preferredStyle: .alert)
                
                // Add button for this notification
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                // Display nofitication
                self.present(alert, animated: true, completion: nil)
            }
           }
       
        // Use delegate and datasource
        myTable.delegate = self
        myTable.dataSource = self
        
        // set row height
        self.myTable.rowHeight = self.myTable.frame.size.height/4.5
        
        // hide navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
        // hide empty cell
        myTable.tableFooterView = UIView()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // name, student code, main class, email.
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = myTable.dequeueReusableCell(withIdentifier: "INFO") as! INFO_TableViewCell
        
        line.icon.image = UIImage(named: arr_title[indexPath.row])
        
        line.lbl_content.text = info[indexPath.row]
        
        return line
    }
    
}
