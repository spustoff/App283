//
//  SettingsView.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                Button(action: {
                    
                    guard let url = URL(string: "https://www.termsfeed.com/live/0b89efb6-66ea-4023-8dba-af1975e74fec") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding([.horizontal, .top])
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate us")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding([.horizontal])
                })
                
                Button(action: {
                    
                    CoreDataStack.shared.deleteAllData()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Reset Flights")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding([.horizontal])
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
