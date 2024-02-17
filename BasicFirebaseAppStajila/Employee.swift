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
    
    func saveToDatabase(){
        var dict = ["firstName": name, "lastName": lastName, "age": 17, "phoneNumber": phoneNumber, "email": email] as [String : Any]
        ref.child("employeeList").setValue(dict)
        ref.child("employeeList").key ?? "0"
        
    }
}
