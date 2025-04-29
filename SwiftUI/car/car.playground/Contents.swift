func fill(type: String, value: Float) -> Float? {
//    switch type {
//    case "alcool":
//        return value / 5.0
//    case "gasolina":
//        return value / 5.8
//    case "diesel":
//        return value / 6
//    default :
//        return 0
//    }

    //    ANOTHER SOLUTION
//    if(type == "Gasolina") {
//        return value / 5.8
//    } else if (type == "Alcool") {
//        return value / 5.0
//    } else if (type == "Diesel") {
//        return value / 6
//    }
//    return nil
    
    //    ANOTHER SOLUTION
    
    let coeficients: [String: Float] = [
        "alcool": 5,
        "gasolina": 5.8,
        "diesel": 6
    ]
    
    guard let coeficient = coeficients[type] else { return nil }
    return value / coeficient
}

if let fuel = fill(type: "Gasolina", value: 100) {
    print("You fulled \(fuel) liters")
} else {
    print("Error")
}


func test(from firstScore: Int, and secondScore: Int = 100) -> Int {
    return 0
}


test(firstScore: 100)
test(firstScore: 100, secondScore: 100)
test(from: 100)
test(from: 100, secondScore: 90)
