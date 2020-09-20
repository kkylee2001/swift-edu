import UIKit


// MARK:- Computed Properties
//What is it

struct Rectange{
    var width: Double
    var height: Double
    
    var area: Double{ ///this is the computed property
        width * height
    }///almost like a function.
    
    /*
     If it was to be a function, it would be something like
     
     func area() -> Double{
        return width * heigth
     }
     
    */

}
let square = Rectange(width: 1.0, height: 1.0)
print(square.area)

//MARK:- Getters
// will return something

class Getter{
    var first: String
    var last: String
    
    init(f: String, l: String){
        self.first = f
        self.last = l
    }///initialization of the class
    
    var name: String{
        get{
            return first + " " + last
        }
        
    }
}

let getter = Getter(f: "Kyle", l: "Look-Fong")
print(getter.name)

//MARK:- Setters
//allows you to set the name into something
//and do something with it

struct Setters{
    var first = ""
    var last = ""
    
    var Username: String{
        get{ //getter is required to make a setter
            return first + " " + last
        }set{
            let new = newValue.components(separatedBy: " ") //new value is the new value made
            first = new[0]
            last = new[1]
            print(" First: \(first) \n Last: \(last)")
        }
    }
}
var setter = Setters()
setter.Username = "Kyle Fong"
print(setter.Username)


//MARK:- newValue Local Property

struct New{
    var x: Int
    var y: Int
    
    var area: Int{
        get{
            x * y
        }set{
            x = newValue / y
            y = newValue / x
        }
    }
}

var n = New(x: 1, y: 5)
n.area = 5
print(n.y)
///or
var new = New(x: 0, y: 0)
new.x = 5
new.y = 5

print(new.area)


//MARK:- didSet and 
