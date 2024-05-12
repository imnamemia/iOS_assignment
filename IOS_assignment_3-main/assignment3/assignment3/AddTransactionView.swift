//
//  AddTransactionView.swift
//  assignment3
//
//  Created by Maxim Freeman on 6/5/2024.
//

import SwiftUI
import UIKit

struct AddTransactionView: View {
    @EnvironmentObject var UserDataObject : UserData
    @State var name: String = ""
    @State var date_selection = Date()
    @State var amount: Double = 0.00
    @State var category: Category = .income
    @State var description: String = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                HStack{
                    Text("Transaction name")
                    TextField("Enter name", text : $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                TextField("Amount", value: $amount, formatter: NumberFormatter()).keyboardType(.decimalPad)
                
                Picker("Select a category", selection: $category) {
                    ForEach(Category.allCases) { category_picker in
                        Text(category_picker.rawValue).tag(category_picker)
                    }
                }
                
                DatePicker("Date", selection: $date_selection, displayedComponents: .date)
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
            }
            .navigationBarTitle("Add transaction")
        }
        
        
        Button(action: {
            UserDataObject.addTransaction(date: date_selection, amount: amount, category: category, description: description) //this would use, the info to add the transaction
        }
        ){
            Text("Add")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
        
    }
}

#Preview {
    AddTransactionView().environmentObject(UserData())
}
