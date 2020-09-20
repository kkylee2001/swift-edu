//
//  Bubbles.swift
//  Business Card
//
//  Created by Kyle L. on 7/2/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import SwiftUI

struct Bubbles: View {
    let text: String
    let imageView: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(HStack {
                Image(systemName: imageView).foregroundColor(Color(red: 0.99, green: 0.47, blue: 0.66))
                Text(text).foregroundColor(.black)
                }).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
}}

struct Bubbles_Previews: PreviewProvider {
    static var previews: some View {
        Bubbles(text: "Email", imageView: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
