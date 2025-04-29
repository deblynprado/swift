//
//  Person.swift
//  person-program
//
//  Created by Deblyn Prado on 05/04/25.
//


struct Person {
    private let name: String
    var age: Int
    private let country: String
    private let nationality: String
    private let gender: Gender
    
    init(name: String, age: Int, country: String, nationality: String, gender: Gender) {
        self.name = name
        self.age = age
        self.country = country
        self.nationality = nationality
        self.gender = gender
    }
    
    enum Gender: String {
        case male = "Male"
        case female = "Female"
    }
    
    /// This functions shows a Welcome message to the user
    func sayHello() -> String {
        """
        Hello \(self.name)! You are \(self.age) years old.
        Your country is: \(self.country)
        Your Nationality is: \(self.nationality)
        Your sex is: \(self.gender.rawValue)
        """
    }
    
    mutating func birthday() -> String {
        age += 1
        return """
        Happy Birthday \(name)!!
        Now you are \(age) years old.
        """
    }

}
