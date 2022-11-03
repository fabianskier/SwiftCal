//
//  SwiftCalApp.swift
//  SwiftCal
//
//  Created by Oscar Cristaldo on 2022-11-02.
//

import SwiftUI

@main
struct SwiftCalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
