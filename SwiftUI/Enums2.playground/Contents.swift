enum WeekDays: String {
    case sunday
    case monday
    case tuesday = "tuesday"
    case wednesday
    case thursday
    case friday
    case saturday
}

//let day = WeekDays.tuesday
let day = WeekDays(rawValue: "tuesday")
print(day)
