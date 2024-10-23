//
//  ProfilView.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 21/10/2024.
//

import SwiftUI

struct ProfilView: View {
    @StateObject private var viewModel = ProfilViewModel()
    

    var body: some View {
        VStack {
            Image("LogoWM")
                .resizable()
                .frame(width: 200, height: 200)

            Text(viewModel.profil.prenom)
            Text(viewModel.profil.pseudo)
            
            
            
        }

        .onAppear{
            viewModel.fetchProfil()
        }
    }
}

struct ProfilView_Previews: PreviewProvider{
    static var previews: some View {
        ProfilView()
    }
}
