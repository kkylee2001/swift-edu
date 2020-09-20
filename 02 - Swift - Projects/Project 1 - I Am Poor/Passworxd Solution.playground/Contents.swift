import UIKit

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var password = ""
while password.count < 6{
    password += alphabet.randomElement()!
}
password.shuffled()
print(password)
