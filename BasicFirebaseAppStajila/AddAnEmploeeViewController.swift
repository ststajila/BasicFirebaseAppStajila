//
//  AddAnEmploeeViewController.swift
//  BasicFirebaseAppStajila
//
//  Created by STANISLAV STAJILA on 2/16/24.
//

import UIKit

class AddAnEmploeeViewController: UIViewController {
    @IBOutlet weak var firstNameOutlet: UITextField!
    @IBOutlet weak var lastNameOutlet: UITextField!
    @IBOutlet weak var ageOutlet: UITextField!
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        var empl = Employee(name: firstNameOutlet.text!, lastName: lastNameOutlet.text!, age: 17, phoneNumber: phoneNumberOutlet.text!, email: emailOutlet.text!)
        
        empl.saveToDatabase()
        
    }
    @IBAction func cancelAction(_ sender: Any) {
        Delegate.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}
