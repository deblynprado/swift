//
//  ContentView.swift
//  person-program
//
//  Created by Deblyn Prado on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var ageString: String = ""
    @State var country: String = ""
    @State var nationality: String = ""
    @State var selectedGender: Person.Gender
    @State private var person:Person
    @State private var greetingsMessage: String = ""
    @State private var makeBday: String = ""
    
    var age: Int {
        return Int(ageString) ?? 0
    }
    
    init(person: Person) {
        self._person = State(initialValue: person)
        self._selectedGender = State(initialValue: .male)
    }
    
    var body: some View {
        VStack {
            VStack {
                TextField("Your Name", text: $name)
                    .keyboardType(.default)
                TextField("Your Age", text: $ageString)
                    .keyboardType(.numberPad)
                TextField("Country", text: $country)
                TextField("Nationality", text: $nationality)
                Picker("Gender", selection: $selectedGender) {
                    Text("Male").tag(Person.Gender.male)
                    Text("Female").tag(Person.Gender.female)
                }
                .pickerStyle(.palette)
        }
            .textFieldStyle(.roundedBorder)
            .padding()
            HStack {
                Button("Create Person") {
                    person = Person(
                        name: name,
                        age: age,
                        country: country,
                        nationality: nationality,
                        gender: selectedGender
                    )
                    makeBday = ""
                    greetingsMessage = person.sayHello()
                }
                
                Button("Make Birthday") {
                    greetingsMessage = ""
                    makeBday = person.birthday()
                }
                
                Button("Clear") {
                    greetingsMessage = ""
                    makeBday = ""
                    name = ""
                    ageString = ""
                    country = ""
                    nationality = ""
                }
                .foregroundStyle(.white)
                .tint(.red)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            HStack {
                Text(greetingsMessage)
                Text(makeBday)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView(person: Person(
        name: "Maria Silva",
        age: 25,
        country: "Brasil",
        nationality: "Brasileira",
        gender: .female
    ))
}
