//
//  ContentView.swift
//  testing_app
//
//  Created by Maxim Freeman on 17/4/2024.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @ObservedObject var UserDataObject = UserData()
    var demoData: [Double] = [2, 5, 7, 9, 12, 18]
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {    //add transaction
                    Spacer()
                    Text("Overview")
                    Spacer()
                    NavigationLink(
                        destination: AddTransactionView().environmentObject(UserDataObject),
                        label: {
                            Text("+")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                                .padding(10)
                        })
                }
                
                Spacer()
                
                
                //Graph would go here -> look at video how to make graph
                CardView {
                    VStack {
                        ChartLabel("$900", type: .title)
                        
                        LineChart()
                    }
                    .background(Color.background)
                    
                }
                
                .data(demoData)
                .chartStyle(ChartStyle(backgroundColor: Color.background, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                .frame(height: 300)
                
                List(UserDataObject.getWeeklyTransactions(), id: \.id) { transaction in
                    Text("\(transaction.date):$\(transaction.amount)")
                }
                
                    
                    
                    NavigationLink( //this would be a list with a 'see all >' button on it, instead of this
                        destination: HistoryView().environmentObject(UserDataObject),
                        label: {
                            Text("Payment History")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        })
                    Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
