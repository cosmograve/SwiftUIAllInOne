//
//  3 CancellingMultiplePipelines.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 20.03.2024.
//

import SwiftUI
import Combine

class CancellingMultiplePipelinesViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var firstNameValidation: String = ""
    
    @Published var lastName: String = ""
    @Published var lastNameValidation: String = ""
    
    private var validationVancellables: Set<AnyCancellable> = []
    
    init() {
        $firstName
            .map { $0.isEmpty ? "🤡" : "😻"}
            .sink { [unowned self] value in
                self.firstNameValidation = value
            }
            .store(in: &validationVancellables)
        
        $lastName
            .map { $0.isEmpty ? "🤡" : "😻"}
            .sink { [unowned self] value in
                self.lastNameValidation = value
            }
            .store(in: &validationVancellables)
    }
    
    func cancelAllValidations() {
        firstNameValidation = ""
        lastNameValidation = ""
        validationVancellables.removeAll()
    }
}

struct CancellingMultiplePipelines: View {
    @StateObject private var vm = CancellingMultiplePipelinesViewModel()
    var body: some View {
        Group {
            HStack {
                TextField("Name", text: $vm.firstName)
                    .textFieldStyle(.roundedBorder)
                Text(vm.firstNameValidation)
            }
            HStack {
                TextField("Last Name", text: $vm.lastName)
                    .textFieldStyle(.roundedBorder)
                Text(vm.lastNameValidation)
            }
            
            Button {
                vm.cancelAllValidations()
            } label: {
                Text("cancel validation")
            }
        }
        .padding()
    }
}

#Preview {
    CancellingMultiplePipelines()
}
