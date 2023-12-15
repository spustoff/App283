//
//  MenuDetail.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct MenuDetail: View {
    
    let index: FlightModel
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text(index.flight_number ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Text(index.status ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .regular))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    
                    Spacer()
                    
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
                .padding()
                .padding(.top)
                
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
                    
                    HStack(spacing: 50) {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Price")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("$\(index.flight_cost)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Miles received")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("\(index.miles)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                Text("Notes")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("No notes yet")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("You don't have any notes added for this flight yet.")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

//#Preview {
//    MenuDetail()
//}
