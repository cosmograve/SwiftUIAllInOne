import SwiftUI

struct AlertAndActionSheet: View {
    @State private var isError = false
    
    var body: some View {
        Button {
            isError.toggle()
        } label: {
            Text("Вход")
        }
        .alert(isPresented: $isError, content: {
            Alert(title: Text("title"),
                  primaryButton: .destructive(Text("Delete"), action: {
                
            }),
                  secondaryButton: .cancel())
        })
        //
        .confirmationDialog("Title", isPresented: $isError) {
            Button("Button", role: .destructive) {
            }
        }
    }
}

#Preview {
    AlertAndActionSheet()
}
