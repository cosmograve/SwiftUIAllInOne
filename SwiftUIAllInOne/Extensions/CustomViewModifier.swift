//
//  CustomViewModifier.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 20.03.2024.
//

import SwiftUI

struct CustomViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            content
                .padding(16)
        }
    }
}
extension View {
    func modifyView() -> some View {
        modifier(CustomViewModifier())
    }
}
