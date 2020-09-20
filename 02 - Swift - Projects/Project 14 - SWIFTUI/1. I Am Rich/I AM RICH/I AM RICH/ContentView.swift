//
//  ContentView.swift
//  I AM RICH
//
//  Created by Kyle L. on 7/1/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich").font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
}}}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
