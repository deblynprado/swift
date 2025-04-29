enum WeekDays {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

let day: WeekDays = .monday
print(day)

//func fill(value: Float, type: String) -> Float? {
//    let coeficients: [String: Float] = ["gasolina": 5.6,
//                                        "diesel": 6.4,
//                                        "alcool": 4.2]
//    guard let coeficient = coeficients[type] else { return nil }
//    return value/coeficient
//}

// SWITCH

let name: String = ""

if name == "Paulo" {
    print("Nome Paulo")
} else if name == "Ana" {
    print("Nome Ana")
} else {
    print("Nenhum dos dois")
}

switch name {
case "Paulo": print("Nome Paulo")
case "Ana": print("Nome Ana")
default: print("Nenhum dos dois")
}

// ENUMS

enum FuelType {
    case gasoline
    case diesel
    case alcohol

    func getCoeficient() -> Float {
        switch self {
        case .gasoline: return 5.6
        case .diesel: return 6.2
        case .alcohol: return 4.2
        }
    }
}

func fill(value: Float, type: FuelType) -> Float {
    let coeficient = type.getCoeficient()
    return value / coeficient
}

fill(value: 10, type: .gasoline)

//FuelType.diesel.getCoeficient()
