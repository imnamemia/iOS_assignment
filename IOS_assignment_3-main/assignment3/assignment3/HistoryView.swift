//
//  HistoryView.swift
//  assignment3
//
//  Created by Maxim Freeman on 3/5/2024.
//

import SwiftUI
import Foundation

struct HistoryView: View {
    @EnvironmentObject var UserDataObject : UserData
    
    var body: some View {
        Text("Payment History")
        List(UserDataObject.TransactionHistory, id: \.id) { transaction in
            Text("\(transaction.name) | $\(transaction.amount) | \(transaction.category)  | \(transaction.description) ")
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
}

#Preview {
    HistoryView().environmentObject(UserData())
}
