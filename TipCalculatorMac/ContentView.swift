//
//  ContentView.swift
//  TipCalculatorMac
//
//  Created by Roman Vitenbergskiy Personal on 07/12/2024.
//

import SwiftUI

struct AddButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 50, height: 50)
            .background(Color.blue)
            .clipShape(Circle())
            .overlay(
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

//#if os(macOS)
struct ContentView: View {
    @ObservedObject var viewModel = BillViewModel()

    var body: some View {
        VStack {
            List {
                ForEach($viewModel.rows) { $row in
                    HStack {
                        TextField("Amount", value: $row.billAmount, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)

                        TextField("Tip", value: $row.tipPercentage, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)

                        Text(String(format: "%.2f", row.totalAmount))
                            .frame(width: 100, alignment: .trailing)
                    }
                }
                .onDelete { indexSet in
                    viewModel.rows.remove(atOffsets: indexSet)
                }
            }
            .frame(maxHeight: 300)

            Button(action: {
                viewModel.addRow()
            }) {
                Text("")
            }
            //.padding()
            .buttonStyle(AddButtonStyle())

            Text("Total sum: \(String(format: "%.2f", viewModel.totalSum))")
                .padding()
        }
        .padding()
    }
}
/*#elseif os(iOS)
struct ContentViewIOS: View {
    @ObservedObject var viewModel = BillViewModel()

    var body: some View {
        VStack {
            List {
                ForEach($viewModel.rows) { $row in
                    HStack {
                        TextField("Amount", value: $row.billAmount, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)

                        TextField("Tip", value: $row.tipPercentage, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)

                        Text(String(format: "%.2f", row.totalAmount))
                            .frame(width: 100, alignment: .trailing)
                    }
                }
                .onDelete { indexSet in
                    viewModel.rows.remove(atOffsets: indexSet)
                }
            }
            .frame(maxHeight: 300)

            Button(action: {
                viewModel.addRow()
            }) {
                Text("")
            }
            //.padding()
            .buttonStyle(AddButtonStyle())

            Text("Total sum: \(String(format: "%.2f", viewModel.totalSum))")
                .padding()
        }
        .padding()
    }
}
#endif*/

struct TipCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            //#if os(macOS)
            ContentView()
            //#elseif os(iOS)
            //ContentViewIOS()
            //#endif
        }
    }
}
