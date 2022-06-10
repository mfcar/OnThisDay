//
//  PreferencesView.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 10/06/2022.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        TabView {
            Text("Tab 1 content here")
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Show")
                }
            Text("Tab 2 content here")
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Appearance")
                }
        }
            .frame(width: 200, height: 150)
            .navigationTitle("Settings")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
