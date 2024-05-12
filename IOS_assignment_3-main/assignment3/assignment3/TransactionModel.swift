//
//  TransactionModel.swift
//  assignment3
//
//  Created by Maxim Freeman on 3/5/2024.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case food = "food"
    case transport = "transport"
    case fuel = "fuel"
    case education = "education"
    case entertainment = "entertainment"
    case income = "income"
    case rent = "rent"
    case bill = "bill"
    case misc = "misc"
    
    var id : Category { self }
}

struct Transaction : Identifiable {
    let id : Int
    let name : String
    let date : Date
    let amount : Double
    let category : Category
    let description: String
}
