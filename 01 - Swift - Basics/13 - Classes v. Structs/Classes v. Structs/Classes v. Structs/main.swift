

// CLASSES ARE PASSED BY REFERENCE
let skeleton1 = Enemy(health: 100, attackStrength: 10)
let skeleton2 = skeleton1
///this is not a copy, it is another reference to the same object
skeleton1.takeDamage(amount: 10)

print("Skeleton 1 took 10 damage, so Skeleton 2's health is \(skeleton2.health)")

//STRUCTS ARE PASSED BY VALUE
var zombie1 = EnemyStruct(health: 100, attackStrength: 10)
var zombie2 = zombie1
///this is actual copy, it is not a reference to Zombie 1
zombie1.takeDamage(amount: 10)

print("Zombie 1 took damage, but because it was a struct, it loses no health, leaving its health at \(zombie2.health)")
