import UIKit
//Functions have external and internal inputs
func myFunc(name eman: String){
            ///the first input is the external name, the second is the internal name
    print("Name: \(eman)")
}


myFunc(name: "Kyle")



//the external input can also be nothing
func myColor(_ color: String){
    print("Color: \(color)")
}

myColor("Burnt Orange")
