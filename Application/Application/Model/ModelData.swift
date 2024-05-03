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


func save(_ item : ListItem, filename: String) {
    var file: URL
    do {
        file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(filename)
    } catch {
        fatalError("Couldn't read or create \(filename): \(error.localizedDescription)")
    }
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        try encoder.encode(item).write(to: file)
    } catch {
        print("Couldn't save new entry to \(filename), \(error.localizedDescription)")
    }
}
