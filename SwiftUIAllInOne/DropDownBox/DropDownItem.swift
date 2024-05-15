//
//  DropDownItem.swift
//  DropDownBox
//
//  Created by Алексей Авер on 31.01.2024.
//

import SwiftUI

struct DropDownItem: View {
    var text: String
    var size: CGSize
    var selected: Bool
    var selectedColor: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .frame(width: size.width, height: size.height, alignment: .center)
            .background {
                if selected {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(selectedColor)
                }
            }
    }
}

#Preview {
    DropDownItem(text: "text", size: CGSize(width: 200, height: itemHeight), selected: true, selectedColor: .green)
}
