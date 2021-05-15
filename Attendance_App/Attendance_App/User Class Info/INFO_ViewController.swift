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
    
    let info = [UserDefaults.standard.string(forKey: "name"), UserDefaults.standard.string(forKey: "studentCode"), UserDefaults.standard.string(forKey: "mainClass"),UserDefaults.standard.string(forKey: "email")]
    
    let arr_title = ["name", "id", "class", "mail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = hexStringToUIColor(hex: "#0CC1A2")
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [hexStringToUIColor(hex: "#0CC1A2").cgColor]
//        view.layer.addSublayer(gradientLayer)
        
        myTable.delegate = self
        myTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // 4 lines of infor: name, student number, class, email
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = myTable.dequeueReusableCell(withIdentifier: "INFO") as! INFO_TableViewCell
        
        
        return line
    }

    

}

//func hexStringToUIColor (hex:String) -> UIColor {
//    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//    if (cString.hasPrefix("#")) {
//        cString.remove(at: cString.startIndex)
//    }
//
//    if ((cString.count) != 6) {
//        return UIColor.gray
//    }
//
//    var rgbValue:UInt64 = 0
//    Scanner(string: cString).scanHexInt64(&rgbValue)
//
//    return UIColor(
//        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//        alpha: CGFloat(1.0)
//    )
//}
