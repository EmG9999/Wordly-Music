//
//  Login.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 06/11/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email: String = "user@example.com"
    @State private var password: String = "password123"
    @State private var isLoggedIn: Bool = false // Variable pour la navigation vers ProfilView
    
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
                    login()
                }) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .navigationDestination(isPresented: $isLoggedIn) {
                    ProfilView()
                        .navigationBarBackButtonHidden(true)
                }
                
                
                .padding(.top, 20)
            }
            .padding()
        }
    }
    
    private func login() {
        // Exemple de données utilisateur en "base de données"
        let validEmail = "user@example.com"
        let validPassword = "password123"
        
        // Vérifie si les informations d'identification correspondent
        if email == validEmail && password == validPassword {
            isLoggedIn = true // Active la NavigationLink vers ProfilView
        } else {
            // Affiche un message d'erreur ou traite la connexion échouée
            print("Erreur : Email ou mot de passe incorrect")
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

