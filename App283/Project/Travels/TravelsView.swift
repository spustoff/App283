//
//  TravelsView.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct TravelsView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My Travels")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                VStack(alignment: .leading, content: {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("Total Flights")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                        Text("\(viewModel.flights.count)")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .bold))
                    })
                    
                    Image("graph")
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                .padding()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Number of trips by status")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(["Personal", "Business", "Tourist", "Other"], id: \.self) { index in
                            
                                VStack(alignment: .center, spacing: 8, content: {
                                    
                                    Text(index)
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Text("\(viewModel.flights.filter{$0.status == index}.count)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                    }
                })
                .padding()
                
                Spacer()
            }
        }
        .onAppear {
            
            viewModel.fetchFlights()
        }
    }
}

#Preview {
    TravelsView()
}
