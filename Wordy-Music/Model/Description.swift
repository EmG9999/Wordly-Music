//
//  Description.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 21/10/2024.
//

import Foundation

struct Description: Identifiable, Codable {
    var id = UUID()
    var titre: String
    var image: String
    var description: String
    var typeInstrument: String
    var paysInstrument: String
    var favoris: Int
}
