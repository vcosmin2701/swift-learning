import SwiftUI

struct SimpleMultipleTasks: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                Task(priority: .background) {
                    let image1 = await loadData(name: "image1") // 2s
                    let image2 = await loadData(name: "image2") // 2s
                    let image3 = await loadData(name: "image3") // 2s
                    print(image1, image2, image3) // 6s to print statement
                }
            }
    }
    
    func loadData(name: String) async -> String {
        try? await Task.sleep(for: .seconds(2))
        return "Name: \(name)"
    }
}

#Preview {
    SimpleMultipleTasks()
}
