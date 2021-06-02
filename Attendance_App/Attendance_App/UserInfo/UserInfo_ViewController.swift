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
    
    @IBOutlet weak var circle: UIView!
    
    // Array Info stores data received
    var info:[String]?
    
   // Title of UIAlert when call api fails
    var alert_title:String = ""
    
    // Message of UIAlert
    var alert_message:String = ""
    
    // Array stores name of image in assets
    let arr_title = ["user-4", "id", "class", "mail"]
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Circle().Drawcur(view: circle)
        // Before calling -> no data receive
        info = []
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        // Call api
        self.loadUSerInfo()
        
       
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
        return info!.count // name, student code, main class, email.
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = myTable.dequeueReusableCell(withIdentifier: "INFO") as! INFO_TableViewCell
        
        line.icon.image = UIImage(named: arr_title[indexPath.row])
        
        line.lbl_content.text = info![indexPath.row]
        
        return line
    }
    
    
    func loadUSerInfo() {
        
            // get url
        guard let URL = URL(string: "https://ams-be-yasu.herokuapp.com/auth/me") else {
            fatalError()
        }
        
            var request = URLRequest(url: URL)
        
            // Set http method
            request.httpMethod = "GET"
        
        // Get token from user defaults that stored on app before
        let token = UserDefaults.standard.string(forKey: "accessToken")
        
            // Set HTTP Request Header
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
         
                if let error = error {
                    
                    print("Error took place \(error)")
                    self.spinner.stopAnimating()
                    // Show Alert if error 
                    DispatchQueue.main.sync {
                        
                        let alert = UIAlertController(title: "Error", message: "Cannot show data of user", preferredStyle: .alert)

                        // Add button for this notification
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                        // Display nofitication
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    return
                }
                
                // guard we have data
                guard let data = data else {return}
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    //update status
                    
                    DispatchQueue.main.sync {
                        self.spinner.stopAnimating()
                        self.showAlert(status: httpResponse.statusCode)
                    }
                   
                }
                
                do {
                    
                    let result = try JSONDecoder().decode(User.self, from: data)
                    self.info = [result.name!, String(result.studentCode!), result.mainClass!, result.email!]
                    
                    DispatchQueue.main.async {
                        self.spinner.stopAnimating()
                        self.myTable.reloadData()
                    }
                    
                }
                catch let jsonErr {
                    print(jsonErr)
                
                }
                
            }
        
            task.resume()
    }
    
    func showAlert(status: Int){
        var alert_title = ""
        var alert_message = ""
        let queue = DispatchQueue(label: "CheckStatus")
        queue.async {
            if (status <= 300 && status != 0) {
                return
            }
            else {
                // Update title
                alert_title = "Access denied"
                if status == 400 {
                        
                    // Update message
                    alert_message = "Something Went Wrong."

                    }
                    
                else if status == 401 {
                    
                    // Update message
                    alert_message = "You don't have permission to access."
                    
                    }
                
                else if status == 403 {
                    
                    // Update message
                    alert_message = "Access is forbidden."
                    
                    }
                else if status == 404 {
                    
                    // Update message
                    alert_message = "Incorrect email or password."
                    
                    }
                else {
                    
                    // Update message
                    alert_message = "Something went wrong."
                    
                    }
                DispatchQueue.main.async {
                    // Nofitication
                    let alert = UIAlertController(title: alert_title, message: alert_message, preferredStyle: .alert)
                    
                    
                    // Add button for this notification
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    // Display nofitication
                    self.present(alert, animated: true, completion: nil)
                }
                
                }
        }
    }
}
