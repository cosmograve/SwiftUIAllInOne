//
//  MatchedGeometry.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 31.07.2023.
//

import SwiftUI

struct MatchedGeometry: View {
    @State private var isClicked = false
    @Namespace private var namespace
    var body: some View {
        VStack {
            if !isClicked {
//                RoundedRectangle(cornerRadius: 25)
                Circle()
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 100, height: 100, alignment: .center)
            }
            
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 300, height: 300, alignment: .center)

            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometry2()
    }
}


struct MatchedGeometry2: View {
    let tabs = ["Home", "Browser", "Settings"]
    @State private var selected = ""
    @Namespace private var namespace2
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                ZStack(alignment: .bottom) {
                    if selected == tab {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                            .matchedGeometryEffect(id: "tab", in: namespace2)
                            .frame(width: 35, height: 2) // try without it
                            .offset(y: 10)
                    }
                    
                    Text(tab)
                        .foregroundColor(selected == tab ? .purple : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = tab
                    }
                }
                
            }
        }
        .padding()
    }
    
}
