//
//  TableView.swift
//  OnThisDay
//
//  Created by Marcos Carvalho on 09/06/2022.
//

import SwiftUI

struct TableView: View {
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    @State private var selectedEventID: UUID?
    
    var tableData: [Event]
    
    var body: some View {
        HStack {
            Table(
                sortedTableData,
                selection: $selectedEventID,
                sortOrder: $sortOrder) {
                TableColumn("Year", value: \.year) {
                    Text($0.year)
                }
                .width(min: 50, ideal: 60, max: 100)
                TableColumn("Title", value: \.text)
            }
            if let selectedEvent = selectedEvent {
                EventView(event: selectedEvent)
                    .frame(width: 250)
            } else {
                Text("Select an event for more details...")
                    .font(.title3)
                    .padding()
                    .frame(width: 250)
            }
        }
    }
    
    var sortedTableData: [Event] {
        return tableData.sorted(using: sortOrder)
    }
    
    var selectedEvent: Event? {
        guard let selectedEventID = selectedEventID else {
            return nil
        }
        
        let event = tableData.first {
            $0.id == selectedEventID
        }
        
        return event
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableData: [Event.sampleEvent])
    }
}
