//
//  SidebarView.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 06/06/2022.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: EventType?
    
    var body: some View {
        List(selection: $selection) {
            Section("TOMORROW") {
                ForEach(EventType.allCases, id: \.self) {
                    type in
                    Text(type.rawValue)
                }
            }
        }
        .listStyle(.sidebar)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selection: .constant(nil))
            .frame(width: 200)
    }
}
