import SwiftUI

enum MyErrors: Error {
    case noData, noImage
}

struct Errors: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Button {
            Task(priority: .background) {
                do {
                    let imageName = try await loadImage(name: "image1")
                    print(imageName)
                } catch MyErrors.noData {
                    print("Error: \(MyErrors.noData)")
                } catch MyErrors.noImage {
                    print("Error: \(MyErrors.noImage)")
                }
            }
        } label: {
            Text("Start Task")
        }
    }
    
    func loadImage(name: String) async throws -> String {
        try? await Task.sleep(for: .seconds(3))
        
        let error = true
        if error {
            throw MyErrors.noImage
        }
        
        return "Name: \(name)"
    }
}

#Preview {
    Errors()
}
