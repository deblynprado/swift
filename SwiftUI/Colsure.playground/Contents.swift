//func printName(name: String) {
//    print(name)
//}

func hello(completion: (String) -> Void) {
    completion("Deblyn")
}

//Sintaxe 1
//hello(completion: printName)


//Sintaxe 2
//hello(completion: {
//    print($0)
//})

//Sintaxe 3
hello {
    print($0)
}


