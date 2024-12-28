//
//  TwoAsyncFunc.swift
//  Concurrency
//
//  Created by Vladut Cosmin on 28.12.2024.
//

import SwiftUI

struct TwoAsyncFunc: View {
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
        let result = Task(priority: .background) { () -> String in
            let imageData = await getMetadata()
            return "Name: \(name) Size: \(imageData)"
        }
        
        let message = await result.value
        return message
    }
    
    func getMetadata() async -> Int {
        try? await Task.sleep(for: .seconds(3))
        return 50000
    }
}

#Preview {
    TwoAsyncFunc()
}
