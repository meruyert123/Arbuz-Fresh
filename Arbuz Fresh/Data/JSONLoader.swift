import Foundation

class JSONLoader {
    static func loadJSONData(from fileName: String) -> Data? {
        guard let jsonFileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("JSON file not found.")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonFileURL)
            return jsonData
        } catch {
            print("Failed to load JSON data: \(error)")
            return nil
        }
    }
}
