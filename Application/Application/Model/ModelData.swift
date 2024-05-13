//
//  ModelData.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import Foundation

var listitems: [ListItem] = load("ListItemData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in maind bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//When user add item, then this method used to save item data into json file.
func save(_ item : ListItem, filename: String) {
    var file: URL
    do {
        file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(filename)
        print("File path: \(file.path)")
    } catch {
        fatalError("Couldn't read or create \(filename): \(error.localizedDescription)")
    }
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        let data = try encoder.encode(item)
        try data.write(to: file, options: [.atomicWrite])
        print("Data was successfully saved to \(file.path)")
        //try encoder.encode(item).write(to: file)
    } catch {
        print("Couldn't save new entry to \(filename), \(error.localizedDescription)")
    }
}

//copy the file
func copyFileToDocumentsDirectory(filename: String) {
    let fileManager = FileManager.default
    
    // 번들에서 파일 URL을 구합니다.
    guard let bundleURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
        print("JSON file is missing in the bundle.")
        return
    }
    
    // "Documents" 디렉토리의 경로를 구합니다.
    guard let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
        print("Documents directory not found.")
        return
    }
    
    let destinationURL = documentsDirectory.appendingPathComponent("\(filename).json")
    
    // 파일이 이미 존재하는지 확인합니다.
    if fileManager.fileExists(atPath: destinationURL.path) {
        print("File already exists in Documents directory.")
        return
    }
    
    // 파일을 복사합니다.
    do {
        try fileManager.copyItem(at: bundleURL, to: destinationURL)
        print("File copied successfully.")
    } catch {
        print("Failed to copy file: \(error)")
    }
}

//load data from file
func loadDataFromDocumentsDirectory(filename: String) -> Data? {
    let fileManager = FileManager.default
    
    // "Documents" 디렉토리의 경로를 구합니다.
    guard let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
        print("Documents directory not found.")
        return nil
    }
    
    let fileURL = documentsDirectory.appendingPathComponent("\(filename).json")
    
    // 파일에서 데이터를 로드합니다.
    if let data = try? Data(contentsOf: fileURL) {
        return data
    } else {
        print("Failed to load data from file.")
        return nil
    }
}


//save data to file
func saveDataToDocumentsDirectory(data: Data, filename: String) {
    let fileManager = FileManager.default
    
    // "Documents" 디렉토리의 경로를 구합니다.
    guard let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
        print("Documents directory not found.")
        return
    }
    
    let fileURL = documentsDirectory.appendingPathComponent("\(filename).json")
    
    // 데이터를 파일에 씁니다.
    do {
        try data.write(to: fileURL, options: .atomic)
        print("Data written to file successfully.")
    } catch {
        print("Failed to write data to file: \(error)")
    }
}

