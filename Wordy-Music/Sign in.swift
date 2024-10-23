//
//  Signin - Signup.swift
//  Wordy-Music
//
//  Created by Apprenant89 on 21/10/2024.
//

import SwiftUI

struct Signin___Signup: View {
    
    @State private var CreateUsername: String = ""
    @State private var CreatePassword: String = ""
    @State private var ConfirmPassword: String = ""
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.15, green: 0.33, blue: 0.42).ignoresSafeArea()
                
                VStack {
                    
                    Image("WordlyMusicLogo 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 134 , height: 135)
                        .shadow(radius: 10)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    Text("Créer un compte")
                        .foregroundColor(Color(red: 0.53, green: 0.81, blue: 0.90))
                        .font(.system(size: 20, weight: .bold))
                    
                    TextField("Nom d'utiisateur", text: $CreateUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50)
                    
                    SecureField("Mot de passe", text: $CreatePassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50)
                    
                    SecureField("Mot de passe", text: $ConfirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50)
                    
                    Button(action : {
                        
                    }) {
                        Text("Confirmer")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(red: 0.53, green: 0.81, blue: 0.90))
                            .cornerRadius(10)
                        
                    }
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination : Log_in()) {
                            Text("Déjà membre ?")
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    Signin___Signup()
}
