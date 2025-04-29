//
//  Person.swift
//  personApp
//
//  Created by Deblyn Prado on 15/04/25.
//

import Foundation


struct Person: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func registerUser() -> String {
        "\(name), \(age) anos"
    }
}
