class Enemy {
    var health:Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int){
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func move() {
        print("walks forward")
    }
    
    func attack() {
        print("lands an attack with \(attackStrength) damage")
    }
    
    func takeDamage(amount: Int) {
        health = health - amount
    }
}


struct EnemyStruct {
    var health:Int
    var attackStrength: Int
    
    func move() {
        print("walks forward")
    }
    
    func attack() {
        print("lands an attack with \(attackStrength) damage")
    }
    
    mutating func takeDamage(amount: Int) {
        health = health - amount
    }
}
