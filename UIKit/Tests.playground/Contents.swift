////var isPluggedIn = false
////var hasBateryPower = true
////
////if isPluggedIn || hasBateryPower {
////    print("Let's start the app!")
////} else if hasBateryPower {
////    print("Has Battery")
////} else {
////    print("No Battery")
////}
//
//
//let number = 10
//let divisor = 3
//func divide() {
//    guard divisor != 0 else {
//        print("Não é possível")
//        return
//    }
//    print(Double(number) / Double(divisor))
//}
//
//divide()
//
//
//var needsUpdate = false
//var forceUpdate = true
//
//if needsUpdate || forceUpdate {
//    print("Updating system...")
//} else if forceUpdate {
//    print("Force updating the system")
//} else {
//    print("No update")
//}
//
//let name: String? = nil
//
//if name != nil {
//    let nameStr: String = name!
//    print(nameStr)
//}
//
//
//let nameStr: String = name ?? "Maria"
//print(nameStr)
//
//
//func some() {
//    guard let name = name else { return }
//    print(name)
//}



var name: String? = ""
var nameUnwrap: String

// Coalescence
nameUnwrap = name ?? "Paulo"

// If let
if let nameUnwrapIfLet = name {
    nameUnwrapIfLet = name
}

// Guard let
func guardSome() {
    guard let nameUnwrapIfLet = name else { return }
    nameUnwrap = nameUnwrapIfLet
    
}

