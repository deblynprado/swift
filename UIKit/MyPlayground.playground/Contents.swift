//let firstName: String
//let age: Int
//let address: String
//let phoneNumber: String
//let gender: String
//let cpf: String
//let isAdult: Bool
//
//let numberString: String = "10"
//let numberInt: Int = 10

// OPTIONAL ?
//var numberToInt: Int = Int(numberString)

//let numberToDouble: Double = Double(numberInt)



let numberString: String
//let numberToDouble: Double? = numberString
//var numberToDouble: Double = Double(numberString)

let numberFloat: Float
//let numberFloatToDouble: Double = numberFloat
//var numberFloatToDouble: Double = Double(numberFloat)

let numberFloatTwo: Float
//let numberFloatToInt: Int = numberFloatTwo
//var numberFloatToInt: Int = Int(numberFloatTwo)

let numberInt: Int
//let numberToBool: Bool = numberInt
//var numberToBool: Bool = numberInt != 0


/**==========================================================================================**/

//Consider the following code snippet.
let myConstant = "7"
//What will the type of myConstant be?
//
//d)String

//Consider the following code snippet.
let myConstantTwo = Int("7")
//What will the type of myConstantTwo be?
//
//b)Int?


//What is the compiler error you will see with the following code? (Choose 2)
//let odometer = 0
//odometer = 3.5

//This will result in a runtime error.

//a)Cannot assign to value: 'odometer' is a 'let' constant
//c)Cannot assign value of type "Double" to type Int


let name: String = "Deblyn"
let lastName: String = "Prado"

let fullName = name + lastName

let message = "Bem vindo \(name) \(lastName)"
