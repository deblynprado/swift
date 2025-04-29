/// Example of Struct
/// 
struct Person {
    private let name: String
    var age: Int
    private let country: String
    private let nationality: String
    private let gender: Gender
    
    init(name: String, age: Int, country: String, nationality: String, gender: Gender) {
        self.name = name
        self.age = age
        self.country = country
        self.nationality = nationality
        self.gender = gender
    }
    
    enum Gender: String {
        case male = "Masculino"
        case female = "Feminino"
    }
    
    /// This functions shows a Welcome message to the user
    func sayHello() -> String {
        """
        Olá \(self.name)! Você tem \(self.age) anos.
        Seu país é: \(self.country)
        Sua nacionalidade é: \(self.nationality)
        Você é do sexo \(self.gender.rawValue)
        """
    }
    
    mutating func birthday() -> String {
        age += 1
        return """
        Parabéns \(name)! Hoje é seu aniversário!
        Você agora tem \(age) anos.
        """
    }

}



var personPaulo = Person(name: "Paulo", age: 20, country: "Brasil", nationality: "Brasileiro", gender: .male)
var personAna = Person(name: "Ana", age: 25, country: "Brasil", nationality: "Brasileira", gender: .female)
var personDebyn = Person(name: "Deblyn", age: 37, country: "Brasil", nationality: "Brasileiro", gender: .male)

personDebyn.age = 99


let hello = personPaulo.sayHello()

//print(hello)
print(personPaulo.birthday())

