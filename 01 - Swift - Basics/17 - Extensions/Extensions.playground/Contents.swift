import UIKit

var pi = 3.14159

let piRounded = String(format: "%.2f", pi)
pi.round()
    //It will round the double, but not to a specific number of decimals

//SOLUTION: CREATE AN EXTANSION

var randomInt = 148.99909

extension Double {
    func round(_ to: Int) -> Double {
        let precision = pow(10, Double(to))
        var n = self
        n = n * precision
        n.round()
        n = n / precision
        return n
    }
}

randomInt.round(3)


//EXAMPLE 2

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red
        //creating a red button
button.layer.cornerRadius = 25
button.clipsToBounds = true
        //to make it a circular red button


extension UIButton {
    func makeCircular(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width
    }
}

let button2 = UIButton(frame: CGRect(x: 20, y: 20, width: 30, height: 20))
button2.makeCircular()


//EXTENDING A PROTOCOL
        /// say we have a university system, they all have a function to take a test

protocol graduation {
    func bachelorsGraduation()
}

extension graduation{
    func bachelorsGraduation(){
        print("the students are graduating with a bachelors degree")
    }
}
        //setting a default value for all of the ones that take exams

class Universities{
    var students = 0
    func teach(){
        print("the students are learning how to teach")
    }
    
    func exam(){
        print("the students are taking an exam")
    }
}


class Yale: Universities, graduation{
    }

class Harvard: Universities, graduation{
}

class LoneStar: Universities{
}

let yale = Yale()
yale.bachelorsGraduation()
        //we don't need to call the function in the class
        //it already has a default implementation


//USING EXTENSIONS TO REFACTOR CODE
///Say that it's a house and there are many things houses can do
protocol kitchen{
    func oven()
}

protocol livingRoom{
    func watchTV()
}


class VictorianHouse{
    var numberInHousehold = 5
    var welcomeMat = "WELCOME"
}
//MARK: - The Kitchen Protocol
extension VictorianHouse: kitchen{
    func oven(){
        print("the stove burns down the house")
    }
}
//MARK: - The Living Room Protocol
extension VictorianHouse: livingRoom{
    func watchTV() {
        print("the children watch Spongebob")
    }
}
