//
//  Employee.swift
//  BasicFirebaseAppStajila
//
//  Created by STANISLAV STAJILA on 2/16/24.
//

import Foundation
class Employee{
    var name: String
    var lastName: String
    var age: Int
    var phoneNumber: String
    var email: String
    var key = ""
    
    init(name: String, lastName: String, age: Int, phoneNumber: String, email: String) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
