//
//  ContentView.swift
//  Instagram Clone
//
//  Created by Gourob Mazumder on 29/5/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var showLanguageChoices = false
    @State private var showHomeScreen = false
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    let background = LinearGradient(gradient: Gradient(
        colors: [
            .red.opacity(0.2),
            .purple.opacity(0.2),
            .blue.opacity(0.2)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            background
                .onTapGesture {
                    isEmailFocused = false
                    isPasswordFocused = false
                }
                .ignoresSafeArea(edges: .bottom)
            VStack(spacing: 20) {
                Spacer()
                // language and logo
                VStack(spacing: 60){
                    Text("language-string".localized(language))
                        .font(Font.instaLight())
                        .kerning(1.1)
                        .onTapGesture {
                            //showLanguageChoices = true
                            withAnimation {
                                LocalizationService.shared.language = LocalizationService.shared.language == .english ? .bangla : .english
                            }
                        }
                    Image(.instaIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                }
                
                
                // login and forget password
                VStack(spacing: 12) {
                    TextField("email-string".localized(language), text: $email)
                        .font(Font.instaBold())
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white.gradient.tertiary)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isEmailFocused ? .primary : Color.gray)
                        }
                        .padding(.horizontal)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($isEmailFocused)
                        .tint(.primary)
                        .keyboardType(.emailAddress)
                    
                    
                    
                    SecureField("password-string".localized(language), text: $password)
                        .font(Font.instaBold())
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white.gradient.tertiary)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isPasswordFocused ? .primary : Color.gray)
                        }
                        .padding(.horizontal)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($isPasswordFocused)
                        .tint(.primary)
                    
                    Button {
                        Task {
                            await authenticationVM.logIn(email: email, password: password)
                        }
                    } label: {
                        Text("login-string".localized(language))
                            .font(Font.instaMedium())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.blue)
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                    }
                    
                    Text("forgot-password-string".localized(language))
                        .font(Font.instaMedium())
                        .frame(maxWidth: .infinity)
                        .padding(.top, 20)
                }
                .padding(.top, 60)
                
                Spacer()
                
                //create new account
                VStack {
                    Button {
                        
                    } label: {
                        Text("create-account-string".localized(language))
                            .font(Font.instaMedium())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.blue)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.blue)
                            )
                            .padding()
                    }
                    
                    HStack {
                        Image(systemName: "infinity")
                        Text("Meta")
                        
                    }
                    .font(Font.instaMedium())
                }
                .padding(.bottom, 4)
                .foregroundStyle(.primary.opacity(0.8))
            }
            .ignoresSafeArea(.keyboard)
        }
        .sheet(isPresented: $showLanguageChoices ) {
            Text("Language list here")
                .presentationContentInteraction(.scrolls)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    LoginView()
        .environment(\.locale, Locale.init(identifier: "en"))
        .environmentObject(AuthenticationViewModel())
}
