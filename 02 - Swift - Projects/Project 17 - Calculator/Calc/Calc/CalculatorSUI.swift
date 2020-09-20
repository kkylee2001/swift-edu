

import SwiftUI

struct CalculatorSUI: View{
    @State var selectedOperator: OP = .clear
    @State var isChaingingSecondArray = false
    @State var n1 = ["0"]
    @State var n2 = ["0"]
    @State var showingTotal = ""
    @State var total = 0.0
    @State var isInputting = true
    @State var hasCalculatedTotal = false
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Text(setLabel()).foregroundColor(Color.white).font(.largeTitle).fontWeight(.light)
            }.padding(45).background(Color.black.opacity(0.40))
            HStack{
                ACView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, n1: $n1, n2: $n2, showingTotal: $showingTotal)
                InvertView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, n1: $n1, n2: $n2, isInputting: $isInputting, showingTotal: $showingTotal, text: "+/-")
                OperaterView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, text: "%").onTapGesture {self.selectedOperator = .remainder}
                OperaterView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, text: "/").onTapGesture {self.selectedOperator = .div}
            }
            HStack{
                NumberView(number: "1", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "2", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "3", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                OperaterView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, text: "x").onTapGesture {self.selectedOperator = .mul}
            }
            HStack{
                NumberView(number: "4", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "5", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "6", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                OperaterView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, text: "+").onTapGesture {self.selectedOperator = .add}
            }
            HStack{
                NumberView(number: "7", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "8", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                NumberView(number: "9", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                OperaterView(isChaingingSecondArray: $isChaingingSecondArray, selectedOperator: $selectedOperator, text: "-").onTapGesture {self.selectedOperator = .sub}
            }
            
            
            
            
            
            //MARK: - Calculating Totals and Clearing Amounts
            
            HStack{
                NumberView(number: "0", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                HStack {
                   
                    NumberView(number: ".", n1: $n1, n2: $n2, isChaingingSecondArray: $isChaingingSecondArray, showingTotal: $showingTotal, isInputting: $isInputting, hasCalulatedNumber: $hasCalculatedTotal, selectedOperator: $selectedOperator)
                   
                }
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        
                        Text("=").font(.largeTitle).fontWeight(.light)
                        Spacer()
                    }
                    Spacer()
                }.onTapGesture {
                    self.calculate(n1: self.n1, n2: self.n2, operant: self.selectedOperator)
                    self.n1.removeAll()
                    self.n2.removeAll()
                    self.isChaingingSecondArray = false
                    self.isInputting = false
                    print("EQUALS \n -------------------")
                    print("\(self.n1) is N1")
                    print("\(self.n2) is N2")
                    print("\(self.showingTotal) is showingTotal")
                    print("\(self.isInputting) is isInputting")
                    print("\(self.selectedOperator) is operator")
                    print("\(self.isChaingingSecondArray) is isChainignSecondArray")
                    print("\(self.total) is total")
                    
                }.foregroundColor(Color.black).background(Color(.gray).opacity(0.14))
                
            }
        }.onAppear {
            self.clear()
        }
    }
}

//MARK: - Calculating Functions
extension CalculatorSUI{
    
    func calculate(n1: [String], n2: [String], operant: OP){
        isInputting = false
        switch operant{
        case .add:
            total =  Double(n1.joined())! + Double(n2.joined())!
        case .mul:
            total = Double(n1.joined())! * Double(n2.joined())!
        case .div:
            total = Double(n1.joined())! / Double(n2.joined())!
        case .sub:
            total =  Double(n1.joined())! - Double(n2.joined())!
        case .remainder:
            total = Double(n1.joined())!.truncatingRemainder(dividingBy: Double(n2.joined())!)
        case .clear:
            clear()
        case .total:
            print("def")
        }
        if operant == .div {
            showingTotal = String(format: n1.contains(".") || n2.contains(".") ? "%.3f":"%.2f", total)
            
            
        } else{ showingTotal =  String(format: n1.contains(".") || n2.contains(".") ? "%.3f":"%.0f", total)}
    }
    
    
    func setLabel()->String{
        if isInputting{
            if isChaingingSecondArray{
                return n2.joined()
            }else{return n1.joined()}
        }else{
            return showingTotal
        }
        
    }
    
    func clear(){
        n1.removeAll()
        n2.removeAll()
        isInputting = true
        isChaingingSecondArray = false
    }
}



//MARK: - Interface
struct NumberView: View {
    @State var number = ""
    @Binding var n1: [String]
    @Binding var n2: [String]
    @Binding var isChaingingSecondArray: Bool
    @Binding var showingTotal: String
    @Binding var isInputting: Bool
    @Binding var hasCalulatedNumber: Bool
    @Binding var selectedOperator: OP
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Spacer()
                Text(self.number).font(.largeTitle).fontWeight(.light)
                Spacer()
            }
            Spacer()
        }.background(Color(.red).opacity(0.10)).onTapGesture {
            self.isInputting = true
            if self.isChaingingSecondArray{
                self.n2.append(self.number)
            }else{
                self.n1.append(self.number)
            }
            
            if self.hasCalulatedNumber{
                self.isInputting = true
                self.n1.removeAll()
                self.n2.removeAll()
                self.showingTotal = ""
                self.selectedOperator = .total
            }
            print("NUMBER VIEW \n -----------------------")
            print("\(self.n1) is N1")
            print("\(self.n2) is N2")
            print("\(self.showingTotal) is showingTotal")
            print("\(self.isInputting) is isInputting")
            print("\(self.isChaingingSecondArray) is isChainignSecondArray")
            
        }
        
    }
}

struct OperaterView: View {
    @Binding var isChaingingSecondArray: Bool
    @Binding var selectedOperator: OP
    @State var text = ""
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text(self.text).font(.largeTitle).fontWeight(.light)
                Spacer()
            }
            Spacer()
        }.background(Color(.gray).opacity(0.14)).onTapGesture {
            self.isChaingingSecondArray = true
            self.selectedOperator = self.determineOperator(self.text)
            print("OPERATORVIEW \n -------------------")
            print("\(self.selectedOperator) is operator")
            print("\(self.isChaingingSecondArray) is isChainignSecondArray")
        }
        
    }
}

struct InvertView: View {
    @Binding var isChaingingSecondArray: Bool
    @Binding var selectedOperator: OP
    @Binding var n1: [String]
    @Binding var n2: [String]
    @Binding var isInputting: Bool
    @Binding var showingTotal: String
    @State var text = ""
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text(self.text).font(.largeTitle).fontWeight(.light)
                Spacer()
            }
            Spacer()
        }.background(Color(.gray).opacity(0.14)).onTapGesture {
            
            
            if self.isInputting{
                if self.isChaingingSecondArray{
                    self.n2 = [String(Int(self.n2.joined())! * -1)]
                }else{
                    self.n1 = [String(Int(self.n1.joined())! * -1)]
                }
            }else{
                self.showingTotal = String(Double(self.showingTotal)! * -1)
            }
            
            
            print("Invert View \n -------------------")
            print("\(self.n1) is N1")
            print("\(self.n2) is N2")
            print("\(self.selectedOperator) is operator")
            print("\(self.isChaingingSecondArray) is isChainignSecondArray")
        }
        
    }
}

struct ACView: View {
    @Binding var isChaingingSecondArray: Bool
    @Binding var selectedOperator: OP
    @State var text = "AC"
    @Binding var n1: [String]
    @Binding var n2: [String]
    @Binding var showingTotal: String
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text(self.text).font(.largeTitle).fontWeight(.light)
                Spacer()
            }
            Spacer()
        }.background(Color(.gray).opacity(0.14)).onTapGesture {
            self.isChaingingSecondArray = false
            self.n1.removeAll()
            self.n2.removeAll()
            self.showingTotal = ""
            
            
            print("ACVIEW \n -------------------")
            print("\(self.n1) is N1")
            print("\(self.n2) is N2")
            print("\(self.showingTotal) is showingTotal")
            print("\(self.selectedOperator) is operator")
            print("\(self.isChaingingSecondArray) is isChainignSecondArray")
        }
        
    }
}


extension OperaterView{
    func determineOperator(_ s: String)->OP{
        switch s{
        case "AC":
            return .clear
        case "x":
            return .mul
        case "/":
            return .div
        case "+":
            return .add
        case "-":
            return .sub
        case "%":
            return .remainder
        default:
            return .total
        }
    }
}

