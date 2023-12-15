//
//  MenuFavorited.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct MenuFavorited: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MenuViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Favorites")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                if viewModel.favorited_flights.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No Favorites")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any flights added to your favorites yet")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.favorited_flights, id: \.self) { index in
                            
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
            
            viewModel.getFavoritedFlights()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedFlight {
                
                MenuDetail(index: index)
            }
        })
    }
}

#Preview {
    MenuFavorited(viewModel: MenuViewModel())
}
