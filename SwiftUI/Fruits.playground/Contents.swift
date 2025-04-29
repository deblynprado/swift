var fruits: [String] = ["Maçã", "Banana", "Uva"]

let fruitName: String
fruitName = "Banana"

fruits.append(fruitName)

// Remover
var fruitIndex: Int?

for (index, fruit) in fruits.enumerated() {
    if fruit == fruitName {
        fruitIndex = index
    }
}

if let fruitIndex = fruitIndex {
    fruits.remove(at: fruitIndex)
}

print(fruits)
