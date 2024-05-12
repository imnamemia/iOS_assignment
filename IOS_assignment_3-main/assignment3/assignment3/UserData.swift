//
//  UserData.swift
//  assignment3
//
//  Created by Maxim Freeman on 3/5/2024.
//

import Foundation

class UserData : ObservableObject {
    @Published var TransactionHistory : [Transaction] = []
    
    init() {
        //addTransaction(date: , amount: 50.0, category: .bill)
        //addTransaction(date: "1/1/2024", amount: 50.0, category: .bill)
    }
    
    func addTransaction(date: Date, amount: Double, category: Category, description: String) {
        let object = Transaction(id: TransactionHistory.count+1, name: "test", date: date, amount: amount, category: category, description: description)
        TransactionHistory.append(object)
    }
    
    //for future use, to use UserDefaults
    func saveData() {
        
    }
    
    func loadData() {
        
    }
    
    func getWeeklyTransactions() -> [Transaction] {
        return TransactionHistory
    }
}


