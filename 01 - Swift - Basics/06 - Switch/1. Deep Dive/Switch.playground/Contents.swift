import UIKit

////Don't change this
var twelve = 12
var seven = 7

func dayOfTheWeek(day: Int) {
  
  switch day{
    case 1:
    print("Monday")
    case 2:
    print("Tuesday")
    case 3:
    print("Wednesday")
    case 4:
    print("Thursday")
    case 5:
    print("Friday")
    case 6:
    print("Saturday")
    case 7:
    print("Sunday")
    default:
    print("error")
  }
  
  
  
}

//Don't change this
dayOfTheWeek(day: twelve)
dayOfTheWeek(day: seven)
