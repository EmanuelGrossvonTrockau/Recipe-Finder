//
//  Recipe_FinderApp.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-01.
//

import SwiftUI
import Blackbird


@main
struct Recipe_FinderApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeFinder()
                .environment(\.blackbirdDatabase, AppDatabase.instance )
        }
    }
}
