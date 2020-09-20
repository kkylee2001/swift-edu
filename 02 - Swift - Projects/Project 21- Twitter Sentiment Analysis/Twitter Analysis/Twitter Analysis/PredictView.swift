//
//  ContentView.swift
//  Twitter Analysis
//
//  Created by Kyle L. on 8/21/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI
import SwifteriOS
import CoreML
import SwiftyJSON

struct PredictView: View {
    let swifter = Swifter(consumerKey: "FkItIykvJipkGCSDAPBZiovDl", consumerSecret: "bc5ntbOx8KOS0a4JBtZ741LQq7xusbj8pQh5JCS2iq0GQy1OoB")
    @State var text: String
    @State var stock: String = ""
    @State var prediction: String = ":)"
    @State var showingAlert = false
    @State var tweets = [TweetClassifierInput]()
    @State var score = 0
    @State var errorAlert = false
    var body: some View {
        VStack {
            HStack {
                TextField("Predict Stock", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            Spacer()
            Text("\(stock) recieved the following rating:")
            Text(prediction).font(.largeTitle).fontWeight(.semibold)
            Spacer()
            Button(action: {
                self.score = 0
                print(self.text)
                self.swifter.searchTweet(using: self.text, lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
                    if results != nil{
                    for i in 0..<100{
                        guard let tweet = results[i]["full_text"].string else {
                            self.errorAlert.toggle()
                            return
                        }
                        let tweetInput = TweetClassifierInput(text: tweet)
                        self.tweets.append(tweetInput)
                        print(tweet)
                    }
                        self.Detection(self.tweets)
                       
                    }
                }) { (error) in
                    self.errorAlert.toggle()
                    
                }
                withAnimation{
                    self.stock = self.text}
                print(self.score)
                
            }) {
                Text("Predict")
            }
            Spacer()
        }.accentColor(Color.red.opacity(0.40)).alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Tweet Search"), message: Text("When searching a tweet, use an '@' to search for a tweet, or use a '#' to search for a hashtag"), dismissButton: .destructive(Text("Dismiss")))
        }).alert(isPresented: $errorAlert, content: {
            Alert(title: Text("Error"), message: Text("The ticker that you have entered is incorrect"), dismissButton: .destructive(Text("Dismiss")))
        }).onAppear {
            self.showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PredictView(text: "")
    }
}


extension PredictView{
    func Detection(_ tweets: [TweetClassifierInput]){
        let model = TweetClassifier()
        let prediction = try? model.predictions(inputs: tweets)
        if let pred = prediction{
            for p in pred{
                if p.label == "Pos"{
                    self.score += 1
                }else if p.label == "Neg"{
                    self.score -= 1
                }else{
                    self.score += 0
                }
            }
        }
        
        if self.score >= 0{
            self.prediction = ":)"
        }else if self.score == 0{
            self.prediction = ":|"
        }else{
            self.prediction = ":("
        }
    }

}


