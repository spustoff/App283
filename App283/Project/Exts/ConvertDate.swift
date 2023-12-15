//
//  ConvertDate.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
