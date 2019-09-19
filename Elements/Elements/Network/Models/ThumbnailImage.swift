//
//  ThumbnailImage.swift
//  Elements
//
//  Created by Liana Norman on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ThumbnailImage {
    
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
