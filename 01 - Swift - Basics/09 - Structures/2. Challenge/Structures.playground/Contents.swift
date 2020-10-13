import UIKit

// TODO: Define the struct

struct User {
  var name: String
  var email: String?
  var followers: Int
  var isActive: Bool
  
  func logStatus() {
    if isActive{
      print("\(name) is working hard")
    }else{
      print("\(name) has left earth")
    }
  }
}




// TODO: Initialise the struct


var status = User(name: "Richard", email: nil, followers: 0, isActive: false)
status.logStatus()

