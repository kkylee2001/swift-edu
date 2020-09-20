import UIKit

protocol AdvancedLifeSupport{
    func performCPR()
}
//MARK: - THE OPERATOR/ONE THAT CALLS THE DELEGATE
class Operator{
    var delegate: AdvancedLifeSupport?
    
    func assess(){
        print("can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

//MARK: - PARAMETIC/DELEGATE
struct Parametic: AdvancedLifeSupport{
    func performCPR() {
        print("does chest compressions")
    }
    
    init(callOperator: Operator){
        callOperator.delegate = self
            //determines who the call operator is
    }
}

//MARK: - DOCTOR and Surgeon/DELEGATE
class Doctor: AdvancedLifeSupport{
    init(callOperator: Operator){
        callOperator.delegate = self
    }
    
    func performCPR() {
        print("does chest compression")
    }
    func stethescope(){
        print("listening for heart sounds")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("the surgeon listens to music")
    }
}

//MARK: - Calling the Operator
let emilio = Operator()
let angela = Surgeon(callOperator: emilio)
let natnat = Doctor(callOperator: emilio)

emilio.assess()
emilio.medicalEmergency()
angela.performCPR()
