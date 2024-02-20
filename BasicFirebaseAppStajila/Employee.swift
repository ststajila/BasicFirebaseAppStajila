//
//  Employee.swift
//  BasicFirebaseAppStajila
//
//  Created by STANISLAV STAJILA on 2/16/24.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

class Employee{
    var name: String
    var lastName: String
    var age: Int
    var phoneNumber: String
    var email: String
    var ref = Database.database().reference()
    var key = ""
    
    init(name: String, lastName: String, age: Int, phoneNumber: String, email: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    init(dict: [String:Any]){
        if let n = dict["firstName"] as? String{
            name = n
        }else{
            name = ""
        }
        if let ln = dict["lastName"] as? String{
            lastName = ln
        }else{
            lastName = ""
        }
        if let a = dict["age"] as? Int{
            age = a
        }else{
            age = 0
        }
        if let p = dict["phoneNumber"] as? String{
            phoneNumber = p
        }else{
            phoneNumber = ""
        }
        if let e = dict["email"] as? String{
            email = e
        }else{
            email = ""
        }
    }
    
    func saveToDatabase(){
        let dict = ["firstName": name, "lastName": lastName, "age": age, "phoneNumber": phoneNumber, "email": email] as [String : Any]
        Delegate.ref.child("employeeList").childByAutoId().setValue(dict)
        Delegate.ref.child("employeeList").key ?? "0"
        
    }
    
    func deleteFromDatabase(){
        Delegate.ref.child("employeeList").child(key).removeValue()
    }
}
