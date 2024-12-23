//
//  TipCalculatorMacTests.swift
//  TipCalculatorMacTests
//
//  Created by Roman Vitenbergskiy Personal on 07/12/2024.
//

import XCTest
@testable import TipCalculatorMac

final class TipCalculatorAppTests: XCTestCase {

    
    func testBillRowTotalAmount() {
        let row = BillRow(billAmount: 100, tipPercentage: 15)
        XCTAssertEqual(row.totalAmount, 115, "Total amount should be calculated as billAmount * (1 + tipPercentage / 100)")
    }

    
    func testAddRow() {
        let viewModel = BillViewModel()
        let initialCount = viewModel.rows.count
        viewModel.addRow()
        XCTAssertEqual(viewModel.rows.count, initialCount + 1, "Adding a row should increase the count of rows by 1")
    }

   
    func testTotalSum() {
        let viewModel = BillViewModel()
        viewModel.rows = [
            BillRow(billAmount: 100, tipPercentage: 10),
            BillRow(billAmount: 200, tipPercentage: 20),
        ]
        XCTAssertEqual(viewModel.totalSum, 350, "Total sum should be the sum of all totalAmount values in rows")
    }

    
    func testRemoveRow() {
        let viewModel = BillViewModel()
        viewModel.rows = [
            BillRow(billAmount: 100, tipPercentage: 10),
            BillRow(billAmount: 200, tipPercentage: 20),
        ]
        let initialCount = viewModel.rows.count
        viewModel.rows.remove(at: 0)
        XCTAssertEqual(viewModel.rows.count, initialCount - 1, "Removing a row should decrease the count of rows by 1")
    }
}

