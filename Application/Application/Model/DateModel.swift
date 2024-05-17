//
//  DateModel.swift
//  Application
//
//  Created by Sunghyeok Jang on 12/5/2024.
//

import Foundation

struct DateModel {
    static let dateFormatter = DateFormatter()
    
    static func getTodayString() -> String {
        dateFormatter.dateFormat = "d/MM/YYYY"
        return dateFormatter.string(from: Date())
    }
    
    static func dateToString(date: Date) -> String {
        dateFormatter.dateFormat = "d/MM/YYYY"
        return dateFormatter.string(from: date)
    }
}
