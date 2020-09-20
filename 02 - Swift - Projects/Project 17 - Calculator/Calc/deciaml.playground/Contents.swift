import Cocoa

enum OP{
    case mul
    case div
    case add
    case sub
    case remainder
    case invert
}

class Calculator{
    var showingTotal = ""

    var numbersArray = ["1","0"]
    var secondArray = ["0",".","2","5"]

    var total = 0.0


    func calculate(n1: String, n2: String, operant: OP){
        total = 0
        switch operant{
        case .add:
            total =  Double(n1)! + Double(n2)!
        case .mul:
            total = Double(n1)! * Double(n2)!
        case .div:
            total = Double(n1)! / Double(n2)!
        case .sub:
            total =  Double(n1)! - Double(n2)!
        case .invert:
            total =  Double(n1)! * -1
        case .remainder:
            total = Double(n1)!.truncatingRemainder(dividingBy: Double(n2)!)
        }
        showingTotal = String(format: numbersArray.contains(".") || secondArray.contains(".") ? "%.2f":"%.0f", total)
        print(showingTotal)
    }
    func clearValues(){
        numbersArray = [""]
        secondArray = [""]
        total = 0
        showingTotal = ""
    }
}


/// EXAMPLE
//calculate(n1: numbersArray.joined(), n2: secondArray.joined(), operant: .add)



