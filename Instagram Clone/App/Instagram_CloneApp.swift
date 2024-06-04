//
//  Instagram_CloneApp.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 29/5/24.
//

import SwiftUI
import Firebase

@main
struct Instagram_CloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
