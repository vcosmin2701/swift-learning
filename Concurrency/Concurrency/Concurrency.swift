import SwiftUI

struct Concurrency: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Button {
            let currentTime = Date()
            
            Task(priority: .background) {
                async let imageName1 = loadData(name: "img1")
                async let imageName2 = loadData(name: "img2")
                async let imageName3 = loadData(name: "img3")
                
                let listNames = await "\(imageName1) \(imageName2) \(imageName3)"
                print(listNames)
                print("Total Time: \(Date().timeIntervalSince(currentTime))")
            }
        } label: {
            Text("Run 3 concurrent tasks")
        }
    }
    
    func loadData(name: String) async -> String {
        try? await Task.sleep(for: .seconds(3))
        return "Name: \(name)"
    }
}

#Preview {
    Concurrency()
}
