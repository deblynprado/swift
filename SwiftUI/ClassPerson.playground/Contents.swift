class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func makeBirthday() {
        self.age += 1
    }
    
    func hello() -> String {
        "Olá \(name)"
    }
}

let paulo = Person(name: "Paulo", age: 25)
let pauloTwo = paulo


paulo.age

print(paulo.age)
print(pauloTwo.age)


// Struct
    // Imutaveis, necessitam da palavra 'mutating' antes da func ao alterar parametros dentro da func
    // Auto init, não necessita de init inicial
    // Referencias em copia
    // Não fazem herança

// Class
    // Mutaveis, não possuem palavra 'mutating antes da func ao alterar parametros dentro da func
    // Não possuem auto init, necessitam de init explicito
    // Referencias em memoria / obj
    // Fazem herança


enum AnimalClass {
    case reptile
    case fish
    case bird
    case mammal
    case amphibian
}

class Animal {
    let type: AnimalClass
    
    init(type: AnimalClass) {
        self.type = type
    }
    
    func move() {
        print("Has moved! It's on a new place")
    }
    
    func eat() {
        print("I'm full")
    }
}

class FlighAnimal: Animal {
    init() {
        super.init(type: .bird)
    }
    
    func fly() {
        print("I'm Flyyyyiinnggg")
    }
    
    override func move() {
        print("Flying away from here")
        super.move()
    }
}

let elephant = Animal(type: .mammal)
let bird = FlighAnimal()

elephant.move()
bird.fly()
bird.move()


// Class Doctor
    // 2 propriedades
    // 2 Métodos

// Class Cardio: Medic
    // 2 metodos especificos

class Doctor {
    let crm: String
    let name: String
    
    init(crm: String, name: String) {
        self.crm = crm
        self.name = name
    }
    
    func info() {
        print("""
            This is Dr. \(name)
            My CRM is: \(crm)
            """)
    }
    
    func prescribeMedication(){
        print("Doctors can prescribe medications")
    }
}

class Cardio: Doctor {
    func ekg() {
        print("Let's do an Electrocardiogram")
    }
    
    func stressTest() {
        print("This is a Stress Test")
    }
    
    override func info() {
        super.info()
        print("I'm a Cardiologist")
    }
}

let doc1 = Cardio(crm: "00001", name: "Dre")
doc1.info()


