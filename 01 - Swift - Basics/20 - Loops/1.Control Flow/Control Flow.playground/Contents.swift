//MARK: - FOR LOOPS
//Will run for the amount of times specified
    //ARRAYS
let names = ["Kyle", "Dave"]

for name in names{
    print("Hello \(name)")
}

    //DICTIONARIES
let numLegs = ["Spider": 8, "Ant": 6, "Cat": 4, "Human": 2]
for (name, count) in numLegs{
    print("\(name) has \(count) legs")
}

    //WITHOUT AN ID
let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


    //USING A STRIDE
let minutes = 60
let minuteInterval = 5
for tick in stride(from: 0, to: minutes, by: minuteInterval){
    print(tick)
}


//MARK: - WHILE LOOPS
//WILL DO SOMETHING WHILE SOMETHING IS TRUE

var numberOfOranges = 10
while numberOfOranges < 15{
    numberOfOranges += 1
    print(numberOfOranges)
}

//Repeat While
var array = [0, 1]
repeat{
    var n0 = 0
    var n1 = 1
    let n3 = array[n0] + array[n1]
    n0 += 1
    n1 += 1
    array.append(n3)
}while array.count < 4

print(array)
