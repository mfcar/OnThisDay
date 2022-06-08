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
    @StateObject var appState = AppState()
    @AppStorage("displayMode") var displayMode = DisplayMode.auto

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appState)
                .onAppear {
                    DisplayMode.changeDisplayMode(to: displayMode)
                }
                .onChange(of: displayMode) { newValue in
                    DisplayMode.changeDisplayMode(to: newValue)
                }
        }
        .commands {
            Menus()
        }
    }
}
