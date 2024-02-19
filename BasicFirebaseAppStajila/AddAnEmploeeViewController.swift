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
    var alertController = UIAlertController(title: "Warning", message: "Age field accepts only a whole number!", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "Ok", style: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertController.addAction(alertAction)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if let a = Int(ageOutlet.text!){
            var empl = Employee(name: firstNameOutlet.text!, lastName: lastNameOutlet.text!, age: a, phoneNumber: phoneNumberOutlet.text!, email: emailOutlet.text!)
            
            empl.saveToDatabase()
            
            self.dismiss(animated: true)
        } else{
            present(alertController, animated: true)
        }
        
    }
    @IBAction func cancelAction(_ sender: Any) {
        Delegate.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}
