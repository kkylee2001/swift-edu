//MARK: - STATIC KEYWORD
//Allows you to use a property or method without needing to initialize it or
//create a new object
struct Roses{
    static var name = "Rose"
    static var color = "Red"
    
    static func NameRose(){
        print("The \(name) is \(color)")
    }
}

print(Roses.name)
print(Roses.color)
Roses.NameRose()


struct NonStaticRose{
    var name = "Rose"
    var color = "Red"
    func NameRose(){
        print("The \(name) is \(color)")
    }
}

let rose = NonStaticRose()
print(rose.color)
print(rose.name)
rose.NameRose()
