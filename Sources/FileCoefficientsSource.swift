import Foundation

struct FileCoefficientsSource: CoefficientsSource {
    private let filePath: String
    
    init(path: String) { self.filePath = path }
    
    func get() -> (a: Double, b: Double, c: Double) {
        guard FileManager.default.fileExists(atPath: filePath) else {
            exitAndPrint(errorText: "File \(filePath) does not exist")
        }
        
        guard let text = try? String(contentsOfFile: filePath, encoding: .utf8) else {
            exitAndPrint(errorText: "Invalid file format")
        }
        
        guard let lastScalar = text.unicodeScalars.last,
              CharacterSet.newlines.contains(lastScalar) else {
            exitAndPrint(errorText: "Invalid file format")
        }
        
        guard let line = text.split(whereSeparator: \.isNewline).first else {
            exitAndPrint(errorText: "Invalid file format")
        }
        
        let fields = line.split(separator: " ", omittingEmptySubsequences: false)
        guard fields.count == 3,
              let a = Double(fields[0]),
              let b = Double(fields[1]),
              let c = Double(fields[2]) 
        else {
            exitAndPrint(errorText: "Invalid file format")
        }
        
        guard a != 0 else {
            exitAndPrint(errorText: "Error. a cannot be 0")
        }
        
        return (a, b, c)
    }
    
    private func exitAndPrint(errorText: String) -> Never {
        print(errorText)
        exit(EXIT_FAILURE)
    }
}