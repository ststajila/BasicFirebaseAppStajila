//
//  ViewController.swift
//  BasicFirebaseAppStajila
//
//  Created by STANISLAV STAJILA on 2/16/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class Delegate{
    static var employees: [Employee] = []
    static var ref: DatabaseReference!
    static var tableView: UITableView!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        Delegate.tableView = tableViewOutlet
        
        Delegate.ref = Database.database().reference()
        
        Delegate.ref.child("employeeList").observe(.childAdded) { DataSnapshot in
            let dictionary = DataSnapshot.value as! [String:Any]
            var e = Employee(dict: dictionary)
            Delegate.employees.append(e)
            self.tableViewOutlet.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Delegate.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? EmployeeCell
        
        cell?.nameOutlet.text! = "\(Delegate.employees[indexPath.row].name) \(Delegate.employees[indexPath.row].lastName)"
        
        cell?.ageOutlet.text! = "\(Delegate.employees[indexPath.row].age)"
        
        cell?.phoneOutlet.text! = "\(Delegate.employees[indexPath.row].phoneNumber)"
        cell?.emailOutlet.text! = "\(Delegate.employees[indexPath.row].email)"
        
        return cell!
    }

}

