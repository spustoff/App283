//
//  MenuView.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 20, content: {
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            MenuFavorited(viewModel: viewModel)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                    }
                    
                    HStack {
                        
                        Text("Menu")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .semibold))
                        
                        Spacer()
                    }
                })
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                if viewModel.flights.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No Flights")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any active flights added yet")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.flights, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedFlight = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(spacing: 10) {
                                        
                                        HStack {
                                            
                                            Text(index.airline ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text(index.status ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                            
                                            Button(action: {
                                                
                                                if viewModel.favorited.contains(index.flight_number ?? "") {
                                                    
                                                    if let indexer = viewModel.favorited.firstIndex(of: index.flight_number ?? "") {
                                                        
                                                        viewModel.favorited.remove(at: indexer)
                                                    }
                                                    
                                                } else {
                                                    
                                                    viewModel.favorited.append(index.flight_number ?? "")
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: viewModel.favorited.contains(index.flight_number ?? "") ? "star.fill" : "star")
                                                    .foregroundColor(viewModel.favorited.contains(index.flight_number ?? "") ? .yellow : .gray)
                                                    .font(.system(size: 16, weight: .medium))
                                            })
                                        }
                                        
                                        HStack {
                                            
                                            Text(index.from ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 19, weight: .bold))
                                            
                                            Rectangle()
                                                .fill(.gray.opacity(0.2))
                                                .frame(height: 2)
                                                .frame(maxWidth: .infinity)
                                            
                                            Text(index.to ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 19, weight: .bold))
                                        }
                                        
                                        HStack {
                                            
                                            Text((index.from_date ?? Date()).convertDate(format: "MMM d HH:mm"))
                                                .foregroundColor(.white.opacity(0.6))
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text((index.to_date ?? Date()).convertDate(format: "MMM d HH:mm"))
                                                .foregroundColor(.white.opacity(0.6))
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                })
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
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedFlight {
                
                MenuDetail(index: index)
            }
        })
    }
}

#Preview {
    MenuView()
}
