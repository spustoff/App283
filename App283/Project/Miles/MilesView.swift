//
//  MilesView.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct MilesView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Miles")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                if viewModel.flights.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No Miles")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("There are no milesreceivedfor the\nselected month yet")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.flights, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8, content: {
                                        
                                        Text((index.flight_time ?? Date()).convertDate(format: "MMM d HH:MM"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.flight_number ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    })
                                    
                                    Spacer()
                                    
                                    Text("+\(index.miles) miles")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchFlights()
        }
    }
}

#Preview {
    MilesView()
}
