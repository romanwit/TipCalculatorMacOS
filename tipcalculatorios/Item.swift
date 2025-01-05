//
//  Item.swift
//  tipcalculatorios
//
//  Created by Roman Vitenbergskiy Personal on 05/01/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
