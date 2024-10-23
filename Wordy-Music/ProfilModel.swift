//
//  ProfilModel.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 21/10/2024.
//

import Foundation

struct ProfilModel: Identifiable, Codable  {
    var id = UUID()
    var nom: String
    var prenom: String
    var email: String
    var mdp : String
    var pseudo: String
    var bioProfil : String?
    var photoProfil : String?
    var favoris : Int
    
    init() {
        self.nom = ""
        self.prenom = ""
        self.email = ""
        self.mdp = ""
        self.pseudo = ""
        self.bioProfil = ""
        self.photoProfil = ""
        self.favoris = 1
        
    }
    
}
