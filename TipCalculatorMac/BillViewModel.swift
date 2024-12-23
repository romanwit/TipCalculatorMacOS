//
//  BillView.swift
//  TipCalculatorMac
//
//  Created by Roman Vitenbergskiy Personal on 23/12/2024.
//

import Foundation

class BillViewModel: ObservableObject {
    @Published var rows: [BillRow] = [BillRow(billAmount: 0, tipPercentage: 0)]

    var totalSum: Double {
        return rows.map { $0.totalAmount }.reduce(0, +)
    }

    func addRow() {
        rows.append(BillRow(billAmount: 0, tipPercentage: 0))
    }
}
