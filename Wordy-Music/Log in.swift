//
//  Log in.swift
//  Wordy-Music
//
//  Created by Apprenant89 on 22/10/2024.
//

import SwiftUI

struct Log_in: View {
    
    @StateObject private var viewModel = LoginUserViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 0.15, green: 0.33, blue: 0.42).ignoresSafeArea()
            
            VStack {
                
                Image("WordlyMusicLogo 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200 , height: 200)
                    .padding(.top, 100)
                    .shadow(radius: 10)
                
                Spacer()
                
                
                Text("My account")
                    .foregroundColor(Color(red: 0.53, green: 0.81, blue: 0.90))
                    .font(.system(size: 20, weight: .bold))
                
                TextField("Nom d'utiisateur", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 50)
                
                SecureField("Mot de passe", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 50)
                
                Button(action : {
                    viewModel.loginUser(email: email, password: password) { success in
                        if success {
                            isLoggedIn = true 
                            print("Connexion réussie !")
                        } else {
                            print("Échec de la connexion.")
                        }
                    }
                }) {
                    Text("Log in")
                    
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(red: 0.53, green: 0.81, blue: 0.90))
                        .cornerRadius(10)
                        .padding()
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    Log_in()
}
