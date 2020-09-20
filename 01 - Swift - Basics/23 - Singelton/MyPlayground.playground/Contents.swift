import UIKit

class car{
    var color = "red"
    static let singletonCar = car()
}
//MARK: - Non-Singletons
let mycar = car()
mycar.color = "blue"
    //can create multiple variances of the color of the car, and it will be different
let yourCar = car()
yourCar.color

//MARK: - Singleton Objects
let singleCar = car.singletonCar
singleCar.color = "brown"
    //only one instance of the color of the car, it is a reference
let yourSingleCar = car.singletonCar
yourSingleCar.color = "red"
    //already set the color of the car to brown
    //referencing the brown
    //stays the same in all classes and objects



