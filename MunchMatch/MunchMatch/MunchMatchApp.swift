//
//  MunchMatchApp.swift
//  MunchMatch
//
//  Created by Dylan  Lim on 10/17/23.
//

import SwiftUI
import Firebase

@main
struct MunchMatchApp: App {
    
    init(){
        FirebaseApp.configure()
        print("Configured Firebase")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
