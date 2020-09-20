import UIKit

var numbers = [45, 73, 195, 53]
var computedNumbers: [Int] = []
//CHALLENGE: Multiply the numbers by the one's next to them, (e.g. 45*73, 73* 195, etc).

var sequence: Int

for i in 0...3{
    if i < 3{
    sequence = numbers[i] * numbers[i+1]
    computedNumbers.append(sequence)
    }else{
        sequence = numbers[i] * numbers[0]
        computedNumbers.append(sequence)
    }
}
    
print("The New Numbers: \n\(computedNumbers)")

