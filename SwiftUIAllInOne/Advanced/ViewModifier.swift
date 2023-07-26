//
//  ViewModifier.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 26.07.2023.
//

import SwiftUI

struct DefaultButtonModifier: ViewModifier {
    let bgColor: Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(bgColor: Color = .blue) -> some View {
        modifier(DefaultButtonModifier(bgColor: bgColor))
    }
}

struct ViewModifierExample: View {
    var body: some View {
        VStack {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .withDefaultButtonFormatting()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .withDefaultButtonFormatting(bgColor: .cyan)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .withDefaultButtonFormatting(bgColor: .green)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .withDefaultButtonFormatting(bgColor: .mint)
        }
        
    }
}

struct ViewModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierExample()
    }
}
