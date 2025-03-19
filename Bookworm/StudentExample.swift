//
//  Student.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//
// swift data learning
import Foundation
import SwiftData

// same as @ observable for for swift data instead
@Model
class StudentExample {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
