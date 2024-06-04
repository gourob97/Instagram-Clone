//
//  LandingView.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 4/6/24.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var authVM = AuthenticationViewModel()
    var body: some View {
        if authVM.isLoggedIn {
            HomeView()
                .environmentObject(authVM)
        } else {
            LoginView()
                .environmentObject(authVM)
        }
    }
}

#Preview {
    LandingView()
}
