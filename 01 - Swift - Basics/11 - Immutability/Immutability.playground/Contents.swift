import UIKit

let myNumber = 0
///this is immutable, you cannot change it


struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]

    init(citizens: [String], name: String, resources: [String: Int]) {
        self.citizens = citizens
        self.name = name.uppercased()
        self.resources = resources
    }
    
    mutating func harvestRice(){
        resources["Rice"] = 100
        /// you cannot change the structure itself from within the structure without it being mutating
    }

}

var myTown = Town(citizens: ["Angela", "Kyle", "Artreal"], name: "angelaland", resources: ["Wool": 100])
myTown.citizens.append("Nicki Minaj")
//you can append the citizens from outside the functions, but cannot from inside
print(myTown.citizens)
myTown.harvestRice()
print(myTown.resources)

