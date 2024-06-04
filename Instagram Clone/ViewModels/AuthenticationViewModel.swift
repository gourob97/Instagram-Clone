//
//  AuthenticationViewModel.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 4/6/24.
//

import Foundation
import FirebaseAuth
import SwiftUI

enum AuthState: String {
    case authenticating = "Authenticating"
    case authenticated = "Authenticated"
    case unauthenticated = "Unauthenticated"
}

class AuthenticationViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var isLoggedIn = false
    
    private var authStateHandle : AuthStateDidChangeListenerHandle?
    
    init() {
        isLoggedIn = Auth.auth().currentUser != nil
    }
    
    @MainActor
    func logIn(email: String, password: String) async {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
           
            withAnimation {
                isLoggedIn = true
            }
        } catch {
            print(error)
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            withAnimation {
                isLoggedIn = true
            }
            isLoggedIn = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
