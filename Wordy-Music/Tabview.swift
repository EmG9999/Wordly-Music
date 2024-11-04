//
//  Tabview.swift
//  Wordy-Music
//
//  Created by Apprenant 123 on 23/10/2024.
//

import SwiftUI


struct Tabview: View {
    
    init() {
        // Personnalisation de l'apparence des icônes de la TabView
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor.white // Icônes inactives en blanc
    }
    
    var body: some View {
        TabView {
            // Onglet "Home"
            NavigationView {
                Accueil() // Appel de la vue Accueil
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            // Onglet "Add Sample"
            NavigationView {
                AjouterSample() // Appel de la vue Accueil
            }
                .tabItem {
                    Label("Add Sample", systemImage: "plus.circle.fill")
                }

            // Onglet "Profil"
            NavigationView {
                ProfilView() // Appel de la ProfilView
            }
            .tabItem {
                Label("Profil", systemImage: "person.fill")
            }
        }
        .tint(.black)
    }
}

#Preview {
    Tabview()
}
    