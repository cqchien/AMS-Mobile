//
//  ClassViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // Call class SideMenuTrasition()
    let trasition = SideMenuTrasition()
    
    // Assign data as array
    var data = [ClassDto]()

    
    @IBOutlet weak var ViewTitle: Circle!
    
    @IBOutlet weak var TVClass: UITableView!
    
    @IBAction func LogOut(_ sender: Any) {
        
        // Call func log out
        logOut()
    }
    
    // Button show not finish class
    @IBAction func tapMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController") else {return}
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        
        menuViewController.transitioningDelegate = self
        
        present(menuViewController, animated: true)
    }
    
    
// MARK:- Handle
    
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
    
    // Data transfer using Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as? QR_ViewController {
            destination.studentDetails = data[(TVClass.indexPathForSelectedRow?.row)!]
        }
    }
    
    
//MARK:- UITableView methods

    // Table view count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Switch pages when selecting a section
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "QR_Scanner", sender: self)
    }
    
    // show data display on table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Board link on  
        let cell = self.TVClass.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableCellClass
        
        // Create radius for view
        let darius = cell.roundView.frame.height/5
        cell.roundView.layer.cornerRadius = darius
        
        // Remove the cell highlight color
        cell.selectionStyle = .none
        
        // Add feature courseCode
        cell.courseCode.text = data[indexPath.row].courseCode
        
        // Add feature  teachers name divided into 2 cases
        let x = data[indexPath.row].teacher!
            switch x {
                case .string(_):
                    cell.nameTeacher.text = "No teacher"
                case .teacherClass(let B):
                    cell.nameTeacher.text = B.name!
                }

        // Add feature room
        cell.room.text = self.data[indexPath.row].room
        
        // Add feature timeCheckin
        cell.Attendance.text = self.data[indexPath.row].timesCheckin
        
        return cell;
    }

   
}
