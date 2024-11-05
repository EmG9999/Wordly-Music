//
//  Accueil.swift
//  Wordy-Music
//
//  Created by Apprenant 123 on 22/10/2024.
//
import SwiftUI
import AVFoundation

// Structure pour représenter un élément avec une image et un titre
struct CarouselItem: Identifiable {
    let id = UUID()
    let imageName: String // Nom de l'image
    let title: String     // Titre de l'élément
}

// Tableau des éléments (images et titres)
private var items: [CarouselItem] = [
    CarouselItem(imageName: "afrique", title: "Afrique"),
    CarouselItem(imageName: "amerique", title: "Amerique"),
    CarouselItem(imageName: "asie", title: "Asie"),
    CarouselItem(imageName: "europe", title: "Europe"),
    CarouselItem(imageName: "oceanie", title: "Océanie")
]

struct Accueil: View {
    @State private var isPlaying = false  // État pour gérer l'état de lecture audio
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        // ScrollView and HStack for horizontal scrolling
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
            VStack {
                Image("logo")
                    .shadow(radius: 200)
                // ScrollView and HStack for horizontal scrolling
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        
                        // Boucle sur les éléments pour afficher image et titre
                        ForEach(items) { item in
                            VStack {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 140, height: 185)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                Text(item.title)
                                    .font(.headline)
                                    .padding(.top, 10)
                                    .foregroundStyle(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width - 150, height: 150) // Ajuste la taille du conteneur
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5) // Apply opacity animation
                                    .scaleEffect(y: phase.isIdentity ? 1 : 0.7) // Apply scale animation
                            }
                        }  .padding(.bottom,20)
                    }
                    
                    .scrollTargetLayout() // Align content to the view
                }
                .contentMargins(50, for: .scrollContent) // Add padding
                .scrollTargetBehavior(.viewAligned)
                
                HStack{
                    Text("Instruments")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                        .padding(.trailing, 115)
                    
                    HStack {
                        Text("Filtre")
                            .font(.system(size: 22))
                            .foregroundStyle(.white)
                            .padding()
                        Image("iconFiltre")
                    }.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white, lineWidth: 1)
                            .frame(width: 114, height: 32)
                    )
                }
                Divider()
                    .frame(height: 1)
                    .overlay(.white)
                    .frame(width: 357)
                    .padding(.bottom, 5)
                HStack {
                    Image("tabla")
                        .resizable()
                        .frame(width: 80, height:80 )
                        .cornerRadius(14)
                    
                    VStack (alignment: .leading){
                        Text("Tabla")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Text("Loop")
                            .font(.system(size: 20))
                    }.foregroundStyle(.white)
                        .padding(.trailing, 125)
                    
                    
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
                Spacer()
            }
            
        }
    }
    // Fonction pour lire l'audio
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

// Délégation pour détecter la fin de l'audio
class AudioDelegate: NSObject, AVAudioPlayerDelegate {
    @Binding var isPlaying: Bool
    
    init(isPlaying: Binding<Bool>) {
        _isPlaying = isPlaying
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false // Revenir à l'image de flèche à la fin de l'audio
    }
}


#Preview {
    Accueil()
}




