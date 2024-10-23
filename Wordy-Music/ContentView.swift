//
//  ContentView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 20/09/2024.
//

import SwiftUI

    struct ContentView: View {
        @StateObject private var profilviewmodels = ProfilViewModel()
    
        var body: some View {
            NavigationView {
                
                NavigationLink(destination: ProfilView() ){
                    Text("Voir mon profil")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                VStack {
                    Text("Bienvenue sur la page d'accueil")

                
                }
                .navigationTitle("Accueil")
            }
        }
    }
   #Preview {
    ContentView()
}

