import UIKit


enum opt{
    case mul
    case add
    case sub
    case div
    case idiv
    case remain
}

struct mathematics{
    func doMaths(n1: Int, n2: Int, operant: opt, completion: @escaping (Int)->Void){
        switch operant{
        case .add:
            completion(n1+n2)
        case .div:
            completion(n1/n2)
        case .idiv:
            completion(Int(n1)/Int(n2))
        case .mul:
            completion(n1*n2)
        case .remain:
            completion(n1%n2)
        case .sub:
            completion(n1-n2)
        }
    }
    
}

let brain = mathematics()

struct data{
    var n1: Int
    var n2: Int
    var opt: opt
}

let operators: [data] = [
    data(n1: 1, n2: 1, opt: .add),
    data(n1: 2, n2: 2, opt: .div),
    data(n1: 3, n2: 4, opt: .idiv),
    data(n1: 4, n2: 5, opt: .mul),
    data(n1: 5, n2: 6, opt: .remain),
    data(n1: 6, n2: 7, opt: .sub)

]


for n in operators{
    brain.doMaths(n1: n.n1, n2: n.n2, operant: n.opt) { (total) in
        print("The total is \(total)")
    }
}
