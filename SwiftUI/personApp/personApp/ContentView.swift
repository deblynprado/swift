//
//  ContentView.swift
//  personApp
//
//  Created by Deblyn Prado on 15/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var messageError: String? = nil
    @State var name: String
    @State var age: String
    @State var people : [Person] = [] {
        didSet {
            clear()
        }
    }
    
    func clear() {
        name = ""
        age = ""
    }
    
    var body: some View {
        VStack {
            Text("Registration")
                .font(.headline)
            TextField("Name", text: $name)
            TextField("Age", text: $age)
                .keyboardType(.decimalPad)
            
            Button("Register") {
                guard let ageInt = Int(age) else {
                    messageError = "Ocorreu um erro ao registrar, por favor verifique os dados"
                    return
                }
                messageError = nil
                let person = Person(name: name, age: ageInt)
                people.append(person)
            }
            if let messageError = messageError {
                Text(messageError)
                    .foregroundStyle(.red)
            }
        }
        .padding()
        VStack {
//            List($people) { user in
//                Text(user.registerUser())
//
//            }
            NavigationView {
                List {
                    ForEach(people, id: \.self ) { person in
                        Text(person.registerUser())
                    }
                    .onDelete(perform: deletePerson)
                    .onMove { people.move(fromOffsets: $0, toOffset: $1) }
                }
                .navigationTitle("List of Users")
                .toolbar {
                    EditButton()
                }
            }
        }
    }
    
    func deletePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView(name: "", age: "")
}
