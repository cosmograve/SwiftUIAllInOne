import SwiftUI

struct Toggles: View {
    @State private var isOnToggle = false
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack {
                        Text("Кошелек")
                        Text("Порфиль")
                        Spacer()
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.yellow)
                    .offset(x: isOnToggle ? 100 : 0)
                Text("Что-то")
                    .offset(x: isOnToggle ? 100 : 0)
            }
            Toggle(isOn: $isOnToggle, label: {
                Text("Настройки")
            })
            .padding()
        }
        .animation(.easeInOut, value: isOnToggle)
    }
}

#Preview {
    Toggles()
}
