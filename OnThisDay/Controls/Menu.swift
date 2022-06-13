//
//  Menu.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 07/06/2022.
//

import SwiftUI

struct Menus: Commands {
    @AppStorage("showTotals") var showTotals = true
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    var body: some Commands {
        SidebarCommands()
        ToolbarCommands()
        
        CommandGroup(replacing: .help) {
            Button("ZenQuotes.io web site") {
                showAPIWebSite()
            }
            .keyboardShortcut("/", modifiers: .command)
        }
        
        CommandMenu("Display") {
            Toggle(isOn: $showTotals) {
                Text("Show Totals")
            }
            .keyboardShortcut("t", modifiers: .command)
            
            Divider()
            
            Picker("Appearance", selection: $displayMode) {
                ForEach(DisplayMode.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
        }
    }
    
    func showAPIWebSite() {
        let address = "https://today.zenquotes.io"
        guard let url = URL(string: address) else {
            fatalError("Invalid address")
        }
        NSWorkspace.shared.open(url)
    }
}
