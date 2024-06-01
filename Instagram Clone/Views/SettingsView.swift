//
//  SettingsView.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 1/6/24.
//

import SwiftUI
import UIKit

enum Theme: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case appLight = "Light"
    case appDark = "Dark"
    case systemTheme = "System"
}

struct SettingsView: View {
    @State private var selectedTheme: Theme = .systemTheme
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    Picker("Theme", selection: $selectedTheme) {
                        ForEach(Theme.allCases) { theme in
                            Text(theme.rawValue)
                                .tag(theme)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    Button("Tap") {
                       
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
