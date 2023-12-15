//
//  AddView.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

struct AddView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Flight")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Airline")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.airlines, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.airline = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                                .foregroundColor(viewModel.airline == index ? .white : .gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.airline == index ? Color("primary") : .gray.opacity(0.1)))
                                        })
                                    }
                                }
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(height: 1)
                        
                        VStack(spacing: 10) {
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("From")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.from.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.from)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                DatePicker(selection: $viewModel.from_date, displayedComponents: .date, label: {})
                                    .labelsHidden()
                            }
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("To")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.to.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.to)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                DatePicker(selection: $viewModel.to_date, displayedComponents: .date, label: {})
                                    .labelsHidden()
                            }
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Flight Time")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.flight_time, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(height: 1)
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Status")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(["Personal", "Business", "Tourist", "Other"], id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.status = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                                .foregroundColor(viewModel.status == index ? .white : .gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.status == index ? Color("primary") : .gray.opacity(0.1)))
                                        })
                                    }
                                }
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(height: 1)
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Flight Number")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("EA3252")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.flight_number.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flight_number)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Flight Cost")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.flight_cost.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flight_cost)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Miles")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("100")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.miles.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.miles)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addFlight()
                    
                    UIApplication.shared.endEditing()
                    
                    viewModel.airline = ""
                    viewModel.from = ""
                    viewModel.to = ""
                    viewModel.status = ""
                    viewModel.flight_number = ""
                    viewModel.flight_cost = ""
                    viewModel.miles = ""
                    
                }, label: {
                    
                    Text("Add Flight")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.airline.isEmpty || viewModel.status.isEmpty || viewModel.flight_number.isEmpty || viewModel.flight_cost.isEmpty || viewModel.miles.isEmpty || viewModel.from.isEmpty || viewModel.to.isEmpty ? 0.5 : 1)
                .disabled(viewModel.airline.isEmpty || viewModel.status.isEmpty || viewModel.flight_number.isEmpty || viewModel.flight_cost.isEmpty || viewModel.miles.isEmpty || viewModel.from.isEmpty || viewModel.to.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddView()
}
