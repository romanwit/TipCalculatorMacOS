//
//  BillRow.swift
//  TipCalculatorMac
//
//  Created by Roman Vitenbergskiy Personal on 23/12/2024.
//

import Foundation

struct BillRow: Identifiable {
    let id = UUID()
    var billAmount: Double
    var tipPercentage: Double
    var totalAmount: Double {
        let rawTotal = billAmount * (1 + tipPercentage / 100)
        return (rawTotal * 100).rounded() / 100 
    }
}
