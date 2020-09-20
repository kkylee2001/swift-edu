//
//  ContentView.swift
//  Dicee
//
//  Created by Kyle L. on 7/3/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var left = 1
    @State var right = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    Image("dice\(left)").padding()
                    Image("dice\(right)").padding()
                }.padding(.horizontal)
                Button(action: {
                    self.left = Int.random(in: 1...6)
                    self.right = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .background(Color.red)
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
