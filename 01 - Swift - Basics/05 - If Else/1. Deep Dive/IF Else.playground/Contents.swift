import UIKit

//Don't change this
var aYear =  [1300, 1900, 2008, 2018, 1900, 1809731]

func isLeap(year: [Int]) {
    var leap: Bool = false
    
    for i in 0..<aYear.count{
        if year[i] % 4 == 0 {
            leap = true
        }
        
        if year[i] % 100 == 0{
            leap = false
        }
        
        if year[i] % 400 == 0{
            leap = true
        }
        
        if leap{
            print("YES")
        }else{
            print("NO")
        }
    }
}

//Don't change this
isLeap(year: aYear)



//MARK: - Different Way to Do If Let - Ternery Operator
let falseAttribute = false
        //regular method
if falseAttribute{
    print("it is true")
}else{
    print("false")
}

//different method

falseAttribute ? "it is true":"false"

