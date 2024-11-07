//
//  Login.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 06/11/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = ProfilViewModel()
    @State private var email: String = "lahlouh@gmail.com"
    @State private var password: String = "FabienBarthez"
//    @State private var isLoggedIn: Bool = false // Variable pour la navigation vers ProfilView
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {
                    viewModel.login(email: email, password: password)
                    viewModel.isLoggedIn = true
                }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                    Tabview()
                        .navigationBarBackButtonHidden(true)
                }
                
                
                .padding(.top, 20)
            }
            .padding()
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

