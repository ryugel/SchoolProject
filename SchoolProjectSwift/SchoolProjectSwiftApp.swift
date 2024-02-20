//
//  SchoolProjectSwiftApp.swift
//  SchoolProjectSwift
//
//  Created by Augustin Diabira on 20/02/2024.
//

import SwiftUI
import Firebase
@main
struct SchoolProjectSwiftApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
