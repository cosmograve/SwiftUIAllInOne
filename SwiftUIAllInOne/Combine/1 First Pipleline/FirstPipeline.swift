//
//  FirstPipeline.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 18.03.2024.
//

import SwiftUI
import Combine

class FirstPipelineViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var validation = ""
    
    init() {
        $name
            .map { $0.isEmpty ? "🤡" : "😻"}
            .assign(to: &$validation)
    }
}

struct FirstPipeline: View {
    @StateObject var vm = FirstPipelineViewModel()
    
    var body: some View {
        VStack {
            TextField("Ваше имя ", text: $vm.name )
                .textFieldStyle(.roundedBorder)
                .padding(40)
            Text(vm.validation)
                .padding(40)
        }
        .background(Color.green)
    }
}

#Preview {
    FirstPipeline()
}

