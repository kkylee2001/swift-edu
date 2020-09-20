import UIKit

//Create your function here:
func isOdd(n: Int) -> Bool {
  if n % 2 != 0{
    return true
  }else{
    return false
  }
}


//Do not change the code below.
let testNumber = 1000001
print(isOdd(n: testNumber))
