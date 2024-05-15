//
//  ContentView.swift
//  DropDownBox
//
//  Created by Алексей Авер on 31.01.2024.
//

import SwiftUI

let items = ["first", "second", "third", "fourth"]
let itemHeight: CGFloat = 55.0

struct DDView: View {
    @State private var selection = items.first ?? "Empty"
    
    var body: some View {
        VStack {
            Text("Something")
            Text("Something")
            Text("Something")
            DropDownBox(selected: $selection, content: items, activeTint: .green, inActive: .gray)
            Text("Something")
            Text("Something")
            Text("Something")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    DDView()
}
