//
//  TipCalculatorMacApp.swift
//  TipCalculatorMac
//
//  Created by Roman Vitenbergskiy Personal on 07/12/2024.
//

import SwiftUI
import SwiftData

@main
struct TipCalculatorMacApp: App {
    var sharedModelContainer: ModelContainer = {
        #if os(macOS)
        let schema = Schema([
            Item.self,
        ])
        #elseif os(iOS)
        let schema = Schema([
            ItemIOS.self,
        ])
#endif
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        #if os(macOS)
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        #elseif os(iOS)
        WindowGroup(makeContent: {
            ContentViewIOS()
        })
        .modelContainer(sharedModelContainer)
        #endif
    }
}
