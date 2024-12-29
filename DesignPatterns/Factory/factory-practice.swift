import Foundation

// Protocol definition with documentation
protocol Document {
    /// Opens the document from the specified file path
    /// - Parameter filePath: The path to the document
    func openDocument(filePath: String)
    
    /// Saves the document
    func saveDocument()
    
    /// The file extension for this document type
    var fileExtension: String { get }
    
    /// The size of the document in kilobytes
    var fileSizeKB: Int { get }
}

// Error handling
enum DocumentError: Error {
    case unsupportedDocumentType
    case invalidFilePath
}

// Document implementation
class PDF: Document {
    func openDocument(filePath: String) {
        print("PDF file has been opened")
        print("Reading file..")
    }
    
    func saveDocument(){
        print("PDF document has been saved")
    }
    
    var fileExtension: String {
        return ".pdf"
    }
    
    var fileSizeKB: Int {
        return 32
    }
}

class Word: Document {
    func openDocument(filePath: String) {
        print("Word document has been opened")
        print("Reading file...")
    }
    
    func saveDocument(){
        print("Word document has been saved")
    }
    
    var fileExtension: String {
        return ".word"
    }
    
    var fileSizeKB: Int {
        return 64
    }
}

class Text: Document {
    func openDocument(filePath: String) {
        print("Text document has been opened")
        print("Reading file...")
    }
    
    func saveDocument() {
        print("Text document has been saved")
    }
    
    var fileExtension: String {
        return ".txt"
    }
    
    var fileSizeKB: Int {
        return 16
    }
}

enum DocumentType {
    case pdf
    case word
    case txt
}

// Factory
class DocumentFactory {
    static func createDocument(fileExtension: DocumentType) throws -> Document {
        switch fileExtension {
        case .pdf:
            return PDF()
        case .word:
            return Word()
        case .txt:
            return Text()
        }
    }
}

// Processor
class DocumentProcessor {
    private let document: Document
    
    init(documentType: DocumentType) throws {
        self.document = try DocumentFactory.createDocument(fileExtension: documentType)
    }
    
    func processDocument(filePath: String) throws {
        guard !filePath.isEmpty else {
            throw DocumentError.invalidFilePath
        }
        
        document.openDocument(filePath: filePath)
        document.saveDocument()
        
        print("Processing complete: ")
        print("- Size: \(document.fileSizeKB)KB")
        print("- Extension: \(document.fileExtension)")
    }
}

// Example of usage
do {
    let pdfProcessor = try DocumentProcessor(documentType: .pdf)
    try pdfProcessor.processDocument(filePath: "example/path/document")
} catch {
    print("Error creating document: \(error)")
}
