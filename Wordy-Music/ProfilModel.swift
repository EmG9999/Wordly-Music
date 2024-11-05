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
    var bioProfil : String
    var photoProfil : String
    
    
    init() {
        self.nom = ""
        self.prenom = ""
        self.email = ""
        self.mdp = ""
        self.pseudo = ""
        self.bioProfil = ""
        self.photoProfil = ""
        
    }
    
    init(id: UUID, nom: String, prenom: String, email: String, mdp: String, pseudo: String, bioProfil: String, photoProfil: String) {
            self.id = id
            self.nom = nom
            self.prenom = prenom
            self.email = email
            self.mdp = mdp
            self.pseudo = pseudo
            self.bioProfil = bioProfil
            self.photoProfil = photoProfil
        }
    
}
