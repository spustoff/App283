//
//  MenuViewModel.swift
//  App283
//
//  Created by Вячеслав on 12/15/23.
//

import SwiftUI
import CoreData

final class MenuViewModel: ObservableObject {
    
    @Published var flights: [FlightModel] = []
    @Published var favorited_flights: [FlightModel] = []
    
    @Published var airlines: [String] = ["Emirates", "Turkish Airlines", "Pobeda", "Airwind", "Astana Airlines"]
    
    @Published var airline: String = ""
    @Published var flight_cost: String = ""
    @Published var flight_number: String = ""
    @Published var flight_time: Date = Date()
    
    @Published var from: String = ""
    @Published var from_date: Date = Date()
    @Published var miles: String = ""
    @Published var status: String = ""
    @Published var to: String = ""
    @Published var to_date: Date = Date()
    
    @Published var isDetail: Bool = false
    @Published var selectedFlight: FlightModel? = nil
    
    @AppStorage("favorited") var favorited: [String] = []
    
    func addFlight() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FlightModel", into: context) as! FlightModel
        
        loan.airline = airline
        loan.flight_cost = Int16(flight_cost) ?? 0
        loan.flight_number = flight_number
        loan.flight_time = flight_time
        loan.from = from
        loan.from_date = from_date
        loan.miles = Int16(miles) ?? 0
        loan.status = status
        loan.to = to
        loan.to_date = to_date
        
        CoreDataStack.shared.saveContext()
    }

    func getFavoritedFlights() {
        
        favorited_flights = flights.filter{favorited.contains($0.flight_number ?? "")}
    }
    
    func fetchFlights() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FlightModel>(entityName: "FlightModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.flights = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.flights = []
        }
    }
}
    
