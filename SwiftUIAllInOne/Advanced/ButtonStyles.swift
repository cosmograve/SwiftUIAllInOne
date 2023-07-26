//
//  ButtonStyles.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 26.07.2023.
//

import SwiftUI
struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}
extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}
struct ButtonStyles: View {
    var body: some View {
        Button {
            
        } label: {
            Text("click me")
                .withDefaultButtonFormatting() // from file ViewModifier
        }
        .withPressableStyle()
        .padding(40)

    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyles()
    }
}
