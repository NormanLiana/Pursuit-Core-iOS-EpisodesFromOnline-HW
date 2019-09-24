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
    
   
        
    
}

