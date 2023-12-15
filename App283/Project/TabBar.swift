//
//  TabBar.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if index == .Add {
                        
                        Image(index.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                        
                    } else {
                        
                        VStack(alignment: .center, spacing: 8, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                                .frame(height: 22)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                        })
                        .frame(maxWidth: .infinity)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Menu = "Menu"
    
    case Miles = "Miles"
    
    case Add = "Add"
    
    case Travels = "Travels"
    
    case Settings = "Settings"
    
}

#Preview {
    
    ContentView()
}
