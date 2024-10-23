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
        ZStack{
            LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(red: 0.0/255.0, green: 77.0/255.0, blue: 99.0/255.0), location: 0.45),
                                .init(color: Color(red: 4.0/255.0, green: 156.0/255.0, blue: 204.0/255.0), location: 1.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
            ).ignoresSafeArea()
            VStack {
                
                Image("LogoWM")
                    .resizable()
                    .frame(width: 175, height: 175)
                    .shadow(radius: 20)
                
                Text("@\(viewModel.profil.pseudo)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom , 25)
                    .foregroundStyle(.white)
                
                Text(viewModel.profil.bioProfil)
                    .padding(.horizontal, 40)
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                
                Text("Trendings Samples")
                    .padding(.top, 40)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                
                
                
                
                SampleView()
                
                
            }
            
            .onAppear{
                viewModel.fetchProfil()
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider{
    static var previews: some View {
        ProfilView()
    }
}
