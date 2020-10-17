import Foundation //Don't need to import to use Swift, useful for autocompletion, can also use UIKit if using buttons/labels/etc


//MARK: - Variables and Constants -- In XCode this separates the code into sections
var variable = "Variables"
let constant = "Constant"


//Variables are mutable, constants are immutable
variable += " are mutable"
//variable = "Variables are mutable"

constant += "are immutable"
//Output: Left side of mutating operator isn't mutable: 'constant' is a 'let' constant






//MARK: - Functions
func Function(){
    print("Function with no parameters or returns")
}

Function()
//Output: Functino with no parameters or returns


func Parameter(_ text: String){
    print(text)
    //This function has one argument, so the argument name can be removed when called.
}

Parameter("Position based argument")
//Output: Position based argument



func Parameters(text1: String, text2: String){
    print(text1 + text2)
}
Parameters(text1: "He", text2: "y")
//Output: Hey




func returning(text: String)->String{
    return text
}
print(returning(text: "Printing text"))
//Output: Printing Text



//Anonmyous Functions
//regular function
func calculator(n1: Int, n2: Int, calculate: (Int, Int)->Void){
    calculate(n1, n2)
}
//Closure
calculator(n1: 8, n2: 9) { (num1, num2)  in
    print( num1 + num2 )
}
//press enter on (Int,Int)->Void
//Output: 17




//MARK: - Data Types
//Raw Types
let boolean = true
let string = "String"
let interger = 0 //no decimal places
let double = 1.0 //up to 14 decimal places
let float = 1.009 //up to 7 decimal places

//Data Types
let array = [0,1,2,3,4,5] //ONE data type, does not have to be unique
let set: Set = [0,1,0] //ONE data type, unique values
    //set = [0,1]
let dictionary = ["zero": 0, "one":1] //a value and its definition
let tuple = (x: 0, y: "19") //two values in parenthesis, any type


//Function Types
let FunctionType: (Int, String)->String //Specify data type
let voidingFunction: ()->Void


//Creating Own Types
typealias coordinate = (Int, Int)
let point: coordinate = (9,6)
print(point.0)
//Output: 9 -- NOTE: point.1 would be 6


//Sequences
let seq = 1...9
let openSeq = 1..<9 //does not include 9


//Optionals
let optional: Int? = nil

//Enumerations
enum UTClasses{
    case cs
    case mis
    case acc
    case calc
}


//MARK: - Comparison Operators
// || = OR, && = AND
print(1 >= 2 || 2 < 1)
//Output: false
print(1 <= 2 && 2 <= 3)
//Output: true



//MARK: - Loops
//For Loop
for i in 0...9{
    print(i)
}
//Output: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 -- NOTE: All on new lines.


//While Loop:
var enterLoop = 0
while enterLoop != 10{
    print("In Loop")
    enterLoop += 1
}
//Output: In loop, In loop, In loop....(10 times)


//Repeat While Loop
var repWhile = ""
repeat{
    print(repWhile)
    repWhile += "8"
}while repWhile != "88888"

//Output: 8, 88, 888, 8888...(5 times, printed 4 times)


//MARK: - If Else
var UTClass: UTClasses = .calc

if UTClass == .mis{
    print("MIS")
}else if UTClass == .cs{
    print("Coding")
}else{
    print("Anything else")
}

//Ternery Operator
print(UTClass == .cs ? "Coding" : "Something Else")


//Switch Statements
switch UTClass {
    case .cs:
        print("Coding")
    case .mis:
        print("MIS")
    default:
        "Default Value"
}



//MARK: - Exception Handling
//Something that can throw an error

enum Errors: Error{
    case divisionByZero
}
func divide(n1: Int, n2: Int) throws -> Double{
    if n2 == 0{
        throw Errors.divisionByZero
    }
    return Double(n1)/Double(n2)
}

do{
    let division = try divide(n1: 10, n2: 0)
    print("\(division)")
}catch{
    print(error.localizedDescription)
}

//Output: The operation couldn’t be completed. (__lldb_expr_22.Errors error 0.)



//MARK: - Unwrapping Optionals

let optionalValue: Int? = nil

//Coalescing a Default Value - using {OPTIONAL ?? DEFAULT VALUE}
var addedOptional = 0 + (optionalValue ?? 1)
print(addedOptional)
//Output: 1


//Force Unwrap
print(optionalValue!)
Output: Fatal error: Unexpectedly found nil while unwrapping an Optional value: file
    //Most unsafe and prone to error


//If else optionals
if optionalValue != nil{
    print("Not Optional -- if else")
}
//Output:

//If let
if let unwrapped = optionalValue{
    print(unwrapped)
}
//Will assign the unwrapped variable with the optional value, if it exists
//Output:


//Guard let else
guard let notNil = optionalValue else{fatalError("Found Nil")}
//Output: Fatal error: Found Nil: file


//MARK: - Classes and Structs
//Classes are REFERENCE types -- they all refer to the same thing

class enemy{
    var hp = 0
    var strength: Int
    
    init(s: Int){
        self.strength = s
    }
    
    func attack(){
        print("Nothing Yet!")
    }
  
}

let skeleton = enemy(s: 100)
let zombie = skeleton

print(skeleton.hp)
print(zombie.hp)
zombie.hp += 1
print(skeleton.hp)


//Inheritance
//Classess can become a part of another class
class EnhancedEnemy: enemy{
    override func attack() {
        super.attack() //Doing the same thing from the last class
        print("Attacking")
        print("Our health is currently at \(hp), and strength at \(strength)")
    }
}
let AmongUsImposter = EnhancedEnemy(s: 100)
AmongUsImposter.attack()
//Output: Nothing yet! Our health is currently at 0, and strength at 100

//Structs are VALUE types, they don't refer to the same thing -- creating a copy, CANNOT inherit
struct Bird{
    var name: String
    var canFly: Bool
    
    mutating func changeName(name: String, flying: Bool){ //Values of structs are let by default, change values using mutating
        self.name = name
        self.canFly = flying
    }
    
    func fly(){
        if canFly{
            print("I'm Flying")
        }else{
            print("Silly! \(name)'s can't fly")
        }
    }
}

let eagle = Bird(name: "Eagle", canFly: true)
var remyMa = eagle
remyMa.changeName(name: "Those Bird", flying: false)
eagle.fly()
remyMa.fly()
//Output: I'm Flying, Silly! Those Bird's can't fly
