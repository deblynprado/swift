//var names: [String] = ["Paulo", "Ana", "Roberto"]
//
//names.append("Deblyn")
//print(names)
//
//names.remove(at: 1)
//print(names)
//
//
//names[1] = "Laís"
//print(names)

//var names: [String: String] = ["Paulo": "aprovado",
//                            "Ana": "reprovado"]
//
//var isAllowed = names["Paulo"]
//print(isAllowed)
//
//names.removeValue(forKey: "Ana")
//print(names)
//
//let returnedValue = names.updateValue("repvorado", forKey: "Paulo")
//print(returnedValue)
//print(names)
//
//names.updateValue("aprovado", forKey: "Jose")
//print(names)


let names: [String] = ["Ana", "Pedro", "Paulo"]
var namesStartedWithP: [String] = []
var test: Bool

//for name in names {
//    if name.starts(with: "P") {
//        namesStartedWithP.append(name)
//        print(namesStartedWithP)
//    }
//}

//print("=================")
//
//for name in names where name.starts(with: "P") {
//    namesStartedWithP.append(name)
//    print(namesStartedWithP)
//}
//
//print("=================")

print(names.filter({ $0.starts(with: "P") }))

print("=================")

for (index, name) in names.enumerated() {
    if name.starts(with: "P") { namesStartedWithP.append(name)}
}

print(namesStartedWithP)
print("=================")

let newName: (firstName: String, lastName: String, age: Int) = ("Ana", "Paula", 25)
print(newName.firstName)
