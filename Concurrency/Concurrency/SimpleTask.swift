import SwiftUI

struct SimpleTask: View {
    var body: some View {
        Text("Hello, World!")
            .task(priority: .background) {
                let imageName = await loadData(name: "image1")
                print(imageName)
            }
    }
    
    func loadData(name: String) async ->  String {
        try? await Task.sleep(for: .seconds(2))
        return "Name: \(name)"
    }
}

#Preview {
    SimpleTask()
}
