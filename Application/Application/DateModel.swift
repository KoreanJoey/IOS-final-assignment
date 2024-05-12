//
//  DateModel.swift
//  Application
//
//  Created by Sunghyeok Jang on 12/5/2024.
//

import Foundation

struct DateModel {
    static let dateFormatter = DateFormatter()
    
    static func getTodayDateString() -> String {
        dateFormatter.dateFormat = "d/MM/YYYY"
        return dateFormatter.string(from: Date())
    }
    
    static func calculateRemainingDay(expireDateString: String) -> Int? {
        dateFormatter.dateFormat = "d/MM/YYYY"
        
        guard let targetDate = dateFormatter.date(from: expireDateString) else {
            return nil
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        let components = calendar.dateComponents([.day], from: currentDate, to: targetDate)
        
        let remain
        guard let days = components.day else {
            return nil
        }
        
        return days
    }
}
