//
//  HomeView.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 4/6/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authVM: AuthenticationViewModel
    var body: some View {
        VStack {
            Text("Welcome Home")
                .font(.largeTitle)
            
            Button("Log out") {
                authVM.logOut()
            }
        }
    }
}

#Preview {
    HomeView()
}
