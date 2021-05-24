//
//  ClassViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let trasition = SideMenuTrasition()
    
    var data = [ClassDto]()

    
    @IBOutlet weak var ViewTitle: Circle!
    
    @IBOutlet weak var TVClass: UITableView!
    
    @IBAction func LogOut(_ sender: Any) {
        
        // Call func log out
        logOut()
    }
    
    @IBAction func tapMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call circle
        Circle().Drawcur(view: ViewTitle.self)
        
        // Call info class
        GetClassInfo{
            data in
            self.data = data
            DispatchQueue.main.async {
                self.TVClass.reloadData()
            }
        }
        
        // Hidden navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
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
        
        // Board link on  
        let cell = self.TVClass.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellClass
        
        // Create radius for view
        let darius = cell.roundView.frame.height/5
        cell.roundView.layer.cornerRadius = darius
        
        // show data display on table view cell
        cell.courseCode.text = data[indexPath.row].courseCode
                
                let x = data[indexPath.row].teacher!
                switch x {
                case .string(_):
                    cell.nameTeacher.text = "Not updated yet"
                case .teacherClass(let B):
                    cell.nameTeacher.text = B.name!
                }

        cell.room.text = self.data[indexPath.row].room
        cell.Attendance.text = self.data[indexPath.row].timesCheckin
        
        return cell;
    }

   
}
