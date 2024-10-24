//
//  DescriptionView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 21/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    var description: Description
    
    var body: some View {
       
            ZStack {
                LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(red: 0.0/255.0, green: 77.0/255.0, blue: 99.0/255.0), location: 0.45),
                                    .init(color: Color(red: 4.0/255.0, green: 156.0/255.0, blue: 204.0/255.0), location: 1.0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                ).ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    AsyncImage(url: URL(string: description.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(30.0)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                    
                    Text(description.titre)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Type d'instrument: \(description.typeInstrument)")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Text("Pays de l'instrument: \(description.paysInstrument)")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Text(description.description)
                        .font(.body)
                        .foregroundStyle(.white)
                    
                }
                .padding()
            }
        
        .navigationTitle("Description")
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: Description(titre: "Tabla", image: "http://localhost:8081/images/Tabla.jpeg", description: "pepe", typeInstrument: "percussion", paysInstrument: "Inde", favoris: 0))
    }
}
