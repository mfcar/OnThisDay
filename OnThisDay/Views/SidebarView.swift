//
//  SidebarView.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 06/06/2022.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: EventType?
    @EnvironmentObject var appState: AppState
    @AppStorage("showBirths") var showBirths = true
    @AppStorage("showDeaths") var showDeaths = true
    @AppStorage("showTotals") var showTotals = true
    @SceneStorage("selectedDate") var selectedDate: String?
    
    var body: some View {
        VStack {
            List(selection: $selection) {
                Section(selectedDate?.uppercased() ?? "TODAY") {
                    ForEach(validTypes, id: \.self) {
                        type in
                        Text(type.rawValue)
                            .badge(
                                showTotals
                                ? appState.countFor(eventType: type, date: selectedDate)
                                : 0)
                    }
                }
                Section("Available Dates") {
                    ForEach(appState.sortedDates, id: \.self) { date in
                        Button {
                            selectedDate = date
                        } label: {
                            HStack {
                                Text(date)
                                Spacer()
                            }
                        }
                        .controlSize(.large)
                        .modifier(DateButtonViewModifier(selected: date == selectedDate))
                    }
                }
                Spacer()
                DayPicker()
            }
            .listStyle(.sidebar)
        }
        .frame(minWidth: 220)
    }
    
    var validTypes: [EventType] {
        var types = [EventType.events]
        if showBirths {
            types.append(.births)
        }
        if showDeaths {
            types.append(.deaths)
        }
        
        return types
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selection: .constant(nil))
            .frame(width: 200)
    }
}

struct DateButtonViewModifier: ViewModifier {
    var selected: Bool
    
    func body(content: Content) -> some View {
        if selected {
            content
                .buttonStyle(.borderedProminent)
        } else {
            content
        }
    }
}
