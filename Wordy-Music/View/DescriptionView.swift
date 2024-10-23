//
//  DescriptionView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 21/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    
    var description: Description
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                AsyncImage(url: URL(string: description.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
                
                Text(description.titre)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Type d'instrument: \(description.typeInstrument)")
                    .font(.subheadline)
                Text("Pays de l'instrument: \(description.paysInstrument)")
                    .font(.subheadline)
                
                Text(description.description)
                    .font(.body)
                
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
