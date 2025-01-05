//
//  Item.swift
//  TipCalculatorMac
//
//  Created by Roman Vitenbergskiy Personal on 07/12/2024.
//

import Foundation
import SwiftData


#if os(macOS)
@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
#elseif os(iOS)
@Model
final class ItemIOS {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
#endif
