//MARK: - CHECKING TYPE
struct Animal{
    var name: String
    var legs: Int
}

struct Plants{
    var eukaryotic: Bool
    var name: String
}

let library: [Any] = [
    Animal(name: "Dog", legs: 4),
    Animal(name: "Human", legs: 2),
    Animal(name: "Cat", legs: 4 ),
    Plants(eukaryotic: true, name: "Venus Fly Trap"),
    Plants(eukaryotic: true, name: "Rose")
    ]
var animalCount = 0
var plantCount = 0
for i in library{
    if i is Animal{
        animalCount += 1
    }else{
        plantCount += 1
    }
}

print("Animal Count: \(animalCount) \nPlant Count \(plantCount)")

//MARK: - DOWNCASTING
//as? Operator

for i in library{
    if let animal = i as? Animal{
        print("Animal: \(animal.name)")
    }else if let plant = i as? Plants{
        print("Plant: \(plant.name)")
    }
}

//as! Operator
    //same as as? operator, but will result in error if
    //type cannot be translated

//MARK: - UPCASTING

var anyValue = 0.0 as Double

if anyValue is Float{
    print("It is Float")
}else{
    print("It is a Double")
}

