//
//  ContentView.swift
//  Business Card
//
//  Created by Kyle L. on 7/2/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.99, green: 0.47, blue: 0.66, alpha: 1))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("profile").resizable().frame(width: 150, height: 150).aspectRatio(contentMode: .fit).clipShape(Circle())
                    .overlay(
                    Circle()
                        .stroke(Color(.white), lineWidth: 5)
                )
                Text("Kyle Look Fong")
                    .font(.custom("Didot", size: 30))
                    .foregroundColor(.white)
                    .underline()
                Text("McCombs School of Business")
                    .font(.custom("Didot", size: 20))
                    .foregroundColor(.white)
                Bubbles(text: "klookfong@utexas.edu", imageView: "envelope")
                Bubbles(text: "(832)528-0847", imageView: "phone")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


