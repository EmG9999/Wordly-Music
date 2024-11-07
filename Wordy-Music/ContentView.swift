//
//  ContentView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 20/09/2024.
//

import SwiftUI

    struct ContentView: View {
        @StateObject private var viewModel = ProfilViewModel()
    
        var body: some View {
            if viewModel.isLoggedIn == false {
                LoginView()
            } else {
                Tabview()
            }
           
        }
    }
   #Preview {
    ContentView()
}

