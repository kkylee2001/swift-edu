

import SwiftUI
//MARK: - View
struct ContentView: View {
    @ObservedObject var brain = HangmanBrain()
    @State var word = [String]()
    @State var showSheet = false
    @State var message = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(self.brain.image).resizable().frame(width: 150, height: 150)
                    VStack {
                        Text("Graveyard:").font(.headline).fontWeight(.light)
                        HStack {
                            ForEach(self.brain.wrongGuesses, id: \.self){wrongChoice in
                                Text(wrongChoice.capitalized)
                            }
                        }
                    }
                }
                
                HStack {
                    ForEach(word, id: \.self){char in
                        Text(self.brain.correctGuesses.contains(char) ? char.capitalized : "_")
                            .font(.largeTitle)
                            
                    }
                }.padding()
                AlphabetLetters(right: self.$brain.correctGuesses, wrong: self.$brain.wrongGuesses) { (letter) in
                    self.brain.guessWord(character: letter)
                    if self.brain.wrongGuesses.count > 5{
                        self.message = "Loser!"
                        self.showSheet = true
                    }else if self.word.allSatisfy({self.brain.correctGuesses.contains($0)}){
                        self.message = "Congrats!"
                        self.showSheet = true
                        
                    }
                    
                }.padding(.bottom, 30)
                
            }.sheet(isPresented: self.$showSheet, content: {
                VStack {
                    Spacer()
                    Text(message).font(.title).fontWeight(.light)
                    Text(message == "Congrats!" ? "You did it!":"The correct word was \(self.brain.word.capitalized)")
                    Spacer()
                }.onDisappear(perform: {
                    self.brain.reset()
                    self.displayReset()
                })
            })
            
            .navigationBarTitle(Text("Hangman Demo"))
            
        }.onAppear(perform: {
            self.brain.reset()
            self.displayReset()
            
        })
    }
    
    func displayReset(){
        self.word = [String]()
        for char in self.brain.word{
            self.word.append("\(char)")
        }
    }
    
    
}


//MARK: - Hangman Brain -- Model

class HangmanBrain: ObservableObject{
    @Published var word = String()
    @Published var wrongGuesses = [String]()
    @Published var correctGuesses = [String]()
    @Published var image = "Hangman0"
    
    let dict = ["swift", "python", "khoo", "management", "information", "systems", "coding", "technical", "austin", "university", "mis at ut", "caresha please", "thee stallion"]
    
    func randomWord(){
        self.word = dict.randomElement()!
    }
    
    
    func guessWord(character: String){
        if self.word.contains(character){
            self.correctGuesses.append(character)
        }else{
            self.wrongGuesses.append(character)
            self.hanging()
        }
    }
    
    func hanging(){
        let count = wrongGuesses.count
        self.image = "Hangman\(count)"
        
    }
    
    func reset(){
        self.word = String()
        self.wrongGuesses.removeAll()
        self.correctGuesses.removeAll()
        self.image = "Hangman0"
        self.randomWord()
        self.correctGuesses.append(" ")
    }
    
}


//MARK: - Alphabet Letters
struct AlphabetLetters: View{
    @Binding var right: [String]
    @Binding var wrong: [String]
    @State var pressGesture: (String)->Void
    let columns = [
        GridItem(.flexible()), //Column 1
        GridItem(.flexible()), //2
        GridItem(.flexible()), //3
        GridItem(.flexible()), //4
        GridItem(.flexible()), //5
        GridItem(.flexible()), //6
        GridItem(.flexible())  //7
    ]
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
                   "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var body: some View{
        LazyVGrid(columns: columns, spacing: 20){
            ForEach(letters, id: \.self){letter in
                Text(letter.capitalized
                ).font(.title).bold()
                .foregroundColor(
                    determineColor(letter: letter)
                    )
                .onTapGesture(perform: {
                    if !right.contains(letter) && !wrong.contains(letter){
                        pressGesture(letter)
                    }
                    
                })
            }
        }
    }
    
    
    func determineColor(letter: String) -> Color{
        if right.contains(letter){
            return .green
        }else if wrong.contains(letter){
            return .red
        }else{
            return .black
        }
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


