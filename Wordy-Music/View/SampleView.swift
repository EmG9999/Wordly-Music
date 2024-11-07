//
//  SampleView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 22/10/2024.
//

import SwiftUI
import AVFoundation



struct SampleView: View {
    @StateObject private var viewModel = DescriptionViewModel()
    @State private var showingSheet = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isPlaying = false
      @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(red: 0.0/255.0, green: 77.0/255.0, blue: 99.0/255.0), location: 0.45),
                        .init(color: Color(red: 4.0/255.0, green: 156.0/255.0, blue: 204.0/255.0), location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.description) { desc in
                        NavigationLink(destination: DescriptionView(description: desc)) {
                            AsyncImage(url: URL(string: desc.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 80, height:80 )
                                    .cornerRadius(14)
                            }placeholder: {
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                            }
                            
                            Text(desc.titre)
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            //                        .padding(.trailing, 125)
                            
                            Spacer()
                            // Ajout du bouton circulaire pour la lecture audio
                            Button(action: {
                                if isPlaying {
                                    pauseAudio() // Si l'audio est en cours de lecture, on met en pause
                                } else {
                                    playAudio()  // Si l'audio n'est pas en lecture, on démarre la lecture
                                }
                            }) {
                                // Image change entre flèche et pause en fonction de l'état
                                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 19, height: 19)
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(Circle().fill(isPlaying ?  Color(red: 237/255, green: 239/255, blue: 119/255): Color.white)) // Change la couleur
                                    .shadow(radius: 10)
                            }
                        }
                    }
                }
                .padding()
                .onAppear() {
                    viewModel.fetchSample()
                }
               }
            }
        }
    func playAudio() {
           guard let url = Bundle.main.url(forResource: "Tabla", withExtension: "wav") else {
               print("Fichier audio introuvable")
               return
           }
           
           do {
               audioPlayer = try AVAudioPlayer(contentsOf: url)
               audioPlayer?.play()
               isPlaying = true
           } catch {
               print("Erreur lors de la lecture du fichier audio : \(error.localizedDescription)")
           }
       }
       
       // Fonction pour mettre en pause l'audio
       func pauseAudio() {
           audioPlayer?.pause()
           isPlaying = false
       }
    }
#Preview {
    SampleView()
}
