import SwiftUI

// do-catch
// try
// throws

class DoTryCatchThrowsDataManager {
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("NEW TEXT", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW TEXT")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    // func that tries to return a string
    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT"
        } else {
            throw URLError(.unknown)
        }
    }
    
    func getTitle4() throws -> String {
        if isActive {
            return "FINAL TEXT!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoTryCatchThrowsViewModel: ObservableObject {
    @Published var text: String = "Starting text."
    let manager = DoTryCatchThrowsDataManager()
    
    func fetchTitle() {
        /*
        let returnedValue = manager.getTitle()
        if let newTitle = returnedValue.title {
            self.text = newTitle
        } else if let error = returnedValue.error {
            self.text = error.localizedDescription
        }
        */
        
        /*
        let result = manager.getTitle2()
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
        */
        
        ///optional try, without do catch block
        /*
        let newTitle = try? manager.getTitle3()
        if let newTitle = newTitle {
            self.text = newTitle
        }
        */

        do {
            // if one of this try fails, the rest of the code
            // will not be executed, in this case, if first try fail
            // the rest will not be executed
            let newTitle = try manager.getTitle3()
            
            // this will not throw the error and not catching it
            let newTitle1 = try? manager.getTitle3()
            if let newTitle1 = newTitle1 {
                self.text = newTitle1
            }
            
            let finalText = try manager.getTitle4()
            self.text = finalText
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct DoTryCatchThrows: View {
    @StateObject private var viewModel = DoTryCatchThrowsViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoTryCatchThrows()
}
