
class Dragon: Enemy {
    var wingSpam = 2
    
    
    func talk(speech: String){
        print("Says \(speech)")
    }
    
    override func move() {
        print("the dragon flys forwrd")
    }
    
    override func attack() {
        super.attack()
        print("Spits Fire")
    }
}


