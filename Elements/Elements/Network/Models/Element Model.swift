//
//  Element Model.swift
//  Elements
//
//  Created by Liana Norman on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Element: Codable {
    let name: String
    let number: Int
    let symbol: String
    let weight: Double
    let meltingPoint: Double?
    let boilingPoint: Double?
    let discoveredBy: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case number
        case symbol
        case weight = "atomic_mass"
        case meltingPoint = "melt"
        case boilingPoint = "boil"
        case discoveredBy = "discovered_by"
    }
    
   
        static func configureElementNumberForThumbnail(elementNumber: Int) -> String {
            var numberStr: String
            switch elementNumber {
            case 1...9:
                numberStr = "00\(String(elementNumber))"
                return numberStr
            case 10...99:
                numberStr = "0\(String(elementNumber))"
                return numberStr
            case 100...118:
                numberStr = "\(String(elementNumber))"
                return numberStr
            default:
                return ""
            }
        }
    
}

//[
//    {
//        "name": "Hydrogen",
//        "appearance": "colorless gas",
//        "atomic_mass": 1.008,
//        "boil": 20.271,
//        "category": "diatomic nonmetal",
//        "color": null,
//        "density": 0.08988,
//        "discovered_by": "Henry Cavendish",
//        "melt": 13.99,
//        "molar_heat": 28.836,
//        "named_by": "Antoine Lavoisier",
//        "number": 1,
//        "period": 1,
//        "phase": "Gas",
//        "source": "https://en.wikipedia.org/wiki/Hydrogen",
//        "spectral_img": "https://en.wikipedia.org/wiki/File:Hydrogen_Spectra.jpg",
//        "summary": "Hydrogen is a chemical element with chemical symbol H and atomic number 1. With an atomic weight of 1.00794 u, hydrogen is the lightest element on the periodic table. Its monatomic form (H) is the most abundant chemical substance in the Universe, constituting roughly 75% of all baryonic mass.",
//        "symbol": "H",
//        "xpos": 1,
//        "ypos": 1,
//        "shells": [
//        1
//        ]
//    },

