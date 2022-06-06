//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 06/06/2022.
//

import SwiftUI

@main
struct OnThisDayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}