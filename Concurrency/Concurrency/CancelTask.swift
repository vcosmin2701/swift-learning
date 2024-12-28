import SwiftUI

struct CancelTask: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                let myTask = Task(priority: .background) {
                    let imageName = await loadData(name: "image1")
                    print(imageName)
                }
                
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                    print("The time is up")
                    myTask.cancel()
                }
            }
    }
    
    func loadData(name: String) async -> String {
        try? await Task.sleep(for: .seconds(2))
        if !Task.isCancelled {
            return "Name: \(name)"
        } else {
            return "Task Cancelled"
        }
    }
}

#Preview {
    CancelTask()
}
