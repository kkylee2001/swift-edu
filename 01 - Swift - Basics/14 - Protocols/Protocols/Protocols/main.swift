
protocol canFly{
    func fly()
}

protocol canSwim{
    func swim()
}

class Bird {
    
    var isFemale = true
    
    func layEggs() {
        if isFemale == true{
            print("lays eggs")
        }else{
            print("no eggs")
        }
    }
}

struct Airplane: canFly{
    func fly(){
        print("plane flys")
    }
}

class Eagle: Bird, canFly {
    func soar(){
        print("the eagle soars")
    }
    func fly(){
        print("eagle flys")
    }
}


class Penguin: Bird, canSwim{
    func swim(){
        print("floats in the water")
    }
}


struct Museum {
    func flyingDemo(flyingObject: canFly){
        flyingObject.fly()
    }
    func swimmingDemo(swimmer: canSwim){
        swimmer.swim()
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let airplane = Airplane()
let museum = Museum()
museum.flyingDemo(flyingObject: myEagle)
museum.swimmingDemo(swimmer: myPenguin)
