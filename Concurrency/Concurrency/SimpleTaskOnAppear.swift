import SwiftUI

struct SimpleTaskOnAppear: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                Task(priority: .background) {
                    let imageName = await loadData(name: "image1")
                    print(imageName)
                }
            }
    }
    
    func loadData(name: String) async -> String {
        try? await Task.sleep(for: .seconds(2))
        return "Name: \(name)"
    }
}

#Preview {
    SimpleTaskOnAppear()
}
