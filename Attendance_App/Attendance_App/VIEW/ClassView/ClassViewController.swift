//
//  ClassViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var Tableview: UITableView!
    
    let info = [UserDefaults.standard.string(forKey: "courseCode"), UserDefaults.standard.string(forKey: "room")]
    let arr_title = ["courseCode","room"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetClassInfo()
        Tableview.dataSource = self
        Tableview.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath)
        return title
    }

}
