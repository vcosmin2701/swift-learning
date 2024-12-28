import SwiftUI

struct ContentView: View {
    var thumbnail: String {
        get async {
            try? await Task.sleep(for: .seconds(3))
            return "mythumbnail"
        }
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding()
            
            Button {
                print("Task started")
                
                Task(priority: .background) {
                    let imageName = await thumbnail
                    print(imageName)
                }
            } label: {
                Text("Start task")
            }
        }
    }
}

#Preview {
    ContentView()
}
