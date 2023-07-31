//
//  CustomTransitions.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 26.07.2023.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}
extension AnyTransition {
    
    static var rotating: AnyTransition {
        .modifier(active: RotateViewModifier(rotation: 180),
                  identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        .asymmetric(insertion: .rotating,
                    removal: .move(edge: .trailing))
    }
    
    static func rotating(amount: Double) -> AnyTransition {
        .modifier(active: RotateViewModifier(rotation: amount),
                  identity: RotateViewModifier(rotation: 0))
    }
    
}
struct CustomTransitions: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                //                    .transition(.move(edge: .leading)) //withoutmodifier
                //                    .transition(AnyTransition.rotating.animation(.easeInOut))
                //                    .transition(.rotating(amount: 1080))
                    .transition(.rotateOn)
            }
            
            Spacer()
            Text("Click Me")
                .withDefaultButtonFormatting() // from file ViewModifier
                .padding(.horizontal, 40)
                .onTapGesture {
                    //                    withAnimation(.easeInOut(duration: 1)) { //speed
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomTransitions_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitions()
    }
}
