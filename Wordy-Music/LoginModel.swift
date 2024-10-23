//
//  LoginModel.swift
//  Wordy-Music
//
//  Created by Apprenant89 on 23/10/2024.
//

import Foundation

struct LoginModel: Identifiable, Codable {
    var id = UUID()
    var nom: String
    var prenom: String
    var email: String
    var mdp: String
    var pseudo: String
    var bioProfil: String
    var photoProfil: String?
    var favoris: Int
}
