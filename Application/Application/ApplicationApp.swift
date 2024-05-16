//
//  ApplicationApp.swift
//  Application
//
//  Created by 조성하 on 22/4/2024.
//

import SwiftUI

@main
struct ApplicationApp: App {
    @StateObject private var dataContorller = DataController()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
            }
            .environment(\.managedObjectContext, dataContorller.container.viewContext)
            
        }
    }
}
