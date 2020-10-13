import UIKit


var p1Username: String?
/// the ? makes it an optional data type

p1Username = "klookfong"
///this is an optional string, it will say optional when printed

print(p1Username)

//1. Force Unwrapping
p1Username = "klookfong"
print(p1Username!)
/// the ! will "force unwrap it," making it into a string, rather than an optional string

//2. Check for Nil Value
let nilValueChecked: String?
nilValueChecked = nil

if nilValueChecked != nil{
    let text: String = nilValueChecked!
    print(text)
}else {
    print("nilValueChecked was found to be nil")
}


//3. Optional Binding
let optionalBinding: String?
optionalBinding = nil

if let safeData = optionalBinding {
    let text: String = safeData
    print(text)
}else{
    print("optionalBinding was nil")
}


//4. Default Values - Nil Coaleascing Operating
let coal: String?
coal = nil

let text: String = coal ?? "coal was nil"
print(text)



//5. Optional Chaining
struct MyStruct {
    var property = 123
    func method(){
        print("this is the method")
    }
}

let myStruct: MyStruct?
myStruct = nil

print(myStruct?.property)
myStruct?.method()
