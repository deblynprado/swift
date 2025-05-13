//func some() throws {
//    
//}
//
//do {
//    try some()
//} catch {
//    print(error)
//}

enum DivErrors: Error {
    case numberTwoNil
    case numberTwoZero
    
    func errorDescription() -> String? {
        switch self {
        case .numberTwoNil:
            return "Number two is nil"
        case .numberTwoZero:
            return "Number two is zero"
        }
    }
}

func div(numOne: Float, numTwo: Float?) throws -> Float {
    guard let numTwo else { throw DivErrors.numberTwoNil }
    guard numTwo != 0 else { throw DivErrors.numberTwoZero }
    
    return numOne / numTwo
}

do {
    let result = try div(numOne: 10, numTwo: 0)
    print(result)
} catch {
    print(error)
}
