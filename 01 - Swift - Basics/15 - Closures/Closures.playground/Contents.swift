import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int{
    return operation(n1, n2)
}

func add(no1: Int, no2: Int) -> Int{
    return no1 + no2
}

func multiply(no1: Int, no2: Int) -> Int{
    return no1 * no2
}
        ///to turn into a closure, remove func and the name, replace with the {, replace { with in.

calculator(n1: 2, n2: 3, operation: add)


calculator(n1: 2, n2: 3, operation: {(no1: Int, no2: Int) -> Int in
    return no1 * no2
})
//instead of making a multiply function, simply make a closure

calculator(n1: 2, n2: 3, operation: {(no1, no2) in
    return no1 * no2
})
//you also don't need the data types

calculator(n1: 2, n2: 3, operation: {(no1, no2) in
     no1 * no2
})
//also don't need the return keyword


calculator(n1: 2, n2: 3, operation: {($0 * $1)})
//you can have the function parameters be anonymous

let result = calculator(n1: 2, n2: 3) {($0 * $1)}
//if it's the last input, you don't need the key term
print(result)


// MAP FUNCTION

let array = [6,2,3,9,4,1]

func addOne(one: Int) -> Int{
    return one + 1
}

array.map(addOne)


//MAP FUNCTION AS A CLOSURE
array.map({(one) in
     one + 1})


array.map({$0 + 1})
