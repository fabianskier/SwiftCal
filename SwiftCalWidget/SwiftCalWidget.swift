//
//  SwiftCalWidget.swift
//  SwiftCalWidget
//
//  Created by Oscar Cristaldo on 2022-11-17.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SwiftCalWidgetEntryView : View {
    var entry: Provider.Entry
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        HStack {
            VStack {
                Text("30")
                    .font(.system(size: 70, design: .rounded))
                    .bold()
                    .foregroundColor(.orange)
                Text("day streak")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            VStack {
                CalendarHeaderView(font: .caption)
                LazyVGrid(columns: columns, spacing: 7) {
                    ForEach(0..<31) { _ in
                        Text("30")
                            .font(.caption2)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.secondary)
                            .background(
                                Circle()
                                    .foregroundColor(.orange.opacity(0.3))
                                    .scaleEffect(1.5)
                            )
                    }
                }
            }
            .padding(.leading, 6)
        }
        .padding()
    }
}

struct SwiftCalWidget: Widget {
    let kind: String = "SwiftCalWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SwiftCalWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct SwiftCalWidget_Previews: PreviewProvider {
    static var previews: some View {
        SwiftCalWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
