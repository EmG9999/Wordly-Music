//
//  AddSampleView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 24/10/2024.
//

import SwiftUI

struct AddSampleView: View {
    @State private var typeInstrument: String = ""  // Correction ici
    @State private var paysInstrument: String = ""
    @State private var titre: String = ""
    @State private var audioURL: URL? = nil
    @State private var isShowingFilePicker = false
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Dégradé en arrière-plan
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(red: 0.0/255.0, green: 77.0/255.0, blue: 99.0/255.0), location: 0.45),
                        .init(color: Color(red: 4.0/255.0, green: 156.0/255.0, blue: 204.0/255.0), location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)  // Assure que le dégradé couvre tout l'écran
                
                Form {
                    // Informations sur le sample
                    Section(header: Text("Informations sur le sample")) {
                        TextField("Nom", text: $titre)
                        TextField("Type d'instrument", text: $typeInstrument)
                        TextField("Pays", text: $paysInstrument)
                    }.foregroundStyle(.black)
                    
                    // Sélection du fichier audio
                    Section(header: Text("Fichier audio")) {
                        if let audioURL = audioURL {
                            Text("Fichier sélectionné : \(audioURL.lastPathComponent)")
                            
                        } else {
                            Text("Aucun fichier sélectionné")
                        }
                        
                        // Bouton pour ouvrir le sélecteur de fichiers
                        Button(action: {
                            isShowingFilePicker = true
                        }) {
                            Text("Sélectionner un fichier audio")
                                
                        }
                    } .foregroundStyle(.black)
                    
                    // Bouton d'enregistrement
                    Section {
                        Button(action: saveSample) {
                            Text("Enregistrer le sample")
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                .scrollContentBackground(.hidden)  // Masquer le fond par défaut de la `Form`
                .navigationTitle("Ajouter un Sample")
               
                .fileImporter(
                    isPresented: $isShowingFilePicker,
                    allowedContentTypes: [.audio],
                    allowsMultipleSelection: false
                ) { result in
                    do {
                        let selectedFile = try result.get().first
                        audioURL = selectedFile
                    } catch {
                        print("Erreur lors de la sélection du fichier : \(error.localizedDescription)")
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Échantillon enregistré"),
                        message: Text("Votre sample a été ajouté avec succès !"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
    
    func saveSample() {
        // Validation et enregistrement du sample
        guard !typeInstrument.isEmpty, !paysInstrument.isEmpty, !titre.isEmpty, audioURL != nil else {
            return
        }
        
        let newSample = Description(titre: titre, image: "", description: "", typeInstrument: typeInstrument, paysInstrument: paysInstrument, favoris: 0)
        // Logique pour enregistrer ou utiliser le sample
        print("Sample enregistré : \(newSample)")
        showingAlert = true
    }
}

#Preview {
    AddSampleView()
}
