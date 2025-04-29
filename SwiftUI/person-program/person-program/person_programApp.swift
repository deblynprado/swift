//
//  person_programApp.swift
//  person-program
//
//  Created by Deblyn Prado on 05/04/25.
//

import SwiftUI

@main
struct person_programApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(person: Person(
                name: "Guest",
                age: 0,
                country: "Unknown",
                nationality: "Unknown",
                gender: .male))
        }
    }
}
