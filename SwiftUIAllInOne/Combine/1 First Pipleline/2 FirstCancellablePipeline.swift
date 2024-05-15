//
//  2 FirstCancellablePipeline.swift
//  SwiftUIAllInOne
//
//  Created by Алексей Авер on 19.03.2024.
//


import SwiftUI
import Combine

class FirstCancellablePipelineViewModel: ObservableObject {
    @Published var data: String = ""
    @Published var status = ""
    
    private var anyCancellable: AnyCancellable?
    
    init() {
        anyCancellable = $data
            .map { [unowned self] value -> String in
                status = "Запрос в банк"
                return value
            }
            .delay(for: 5, scheduler: DispatchQueue.main)
            .sink { [unowned self] value in
                self.data = "Сумма на счетах 1 млн"
                self.status = "Данные получены"
            }
    }
    
    func refresh() {
        data = "Перезапрос..."
    }
    
    func cancel() {
        status = "Операция отменена"
        anyCancellable?.cancel()
        anyCancellable = nil
    }
}

struct FirstCancellablePipelineView: View {
    @StateObject var vm = FirstCancellablePipelineViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(vm.data)
                .font(.title)
                .foregroundStyle(.green)
            
            Text(vm.status)
                .foregroundStyle(.blue)
            Spacer()
            
            HStack {
                Button("обновить") {
                    vm.refresh()
                }
                Spacer()
                Button("отменить") {
                    vm.cancel()
                }
            }
            
        }
        
    }
}

#Preview {
    FirstCancellablePipelineView()
}

