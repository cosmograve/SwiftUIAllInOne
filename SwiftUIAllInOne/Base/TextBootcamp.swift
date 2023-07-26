//
//  TextBootcamp.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 26.07.2023.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.purple)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .underline(true, color: .black)
            .italic()
            .strikethrough(true, color: .red)
        
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
