//
//  DropDownBox.swift
//  DropDownBox
//
//  Created by Алексей Авер on 31.01.2024.
//

import SwiftUI

struct DropDownBox: View {
    @Binding var selected: String
    @State var expanded = false
    var content: [String]
    var activeTint: Color
    var inActive: Color
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                DropDownItem(text: selected,
                             size: geo.size,
                             selected: true,
                             selectedColor: activeTint)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation() {
                        expanded.toggle()
                    }
                }
                ForEach(
                    items.filter { item in
                        item != selected
                    }, id: \.self) { item in
                        DropDownItem(text: item,
                                     size: geo.size,
                                     selected: false,
                                     selectedColor: activeTint)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation() {
                                if expanded {
                                    selected = item
                                    expanded = false
                                } else {
                                    if selected == item {
                                        expanded = true
                                    }
                                    
                                }
                            }
                        }
                    }
            }
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(inActive)
                    .transition(.identity)
            }
        }
        .frame(height: itemHeight)
        .overlay(alignment: .trailing) {
            Image(systemName: "chevron.up")
                .padding(.horizontal)
                .rotationEffect(.degrees(expanded ? 180 : 0))
            
        }
        .mask(alignment: .top) {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: expanded ? itemHeight * Double(content.count) : itemHeight)
        }
        .zIndex(1000)
    }
}

#Preview {
    DropDownBox(selected: .constant("First"),
                content: items,
                activeTint: .green,
                inActive: .gray)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
}
