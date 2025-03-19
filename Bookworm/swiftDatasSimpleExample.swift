//
//  ContentView.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//
import SwiftData
import SwiftUI

struct ExampleView: View {
    // read out the live in memory data we are working with right now (model context)
    @Environment(\.modelContext) var modelContext
    // query makes swift data load studnets from modelcontainer, finds main context (made my model container in App) , quries and finds it
    @Query var students: [StudentExample]
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationBarTitle("Classroom")
            //button to add random names and save them into modelContext
            .toolbar {
                Button("add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    // new studnet object
                    let student = StudentExample(id:UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                
                }
            }
        }
    }
}

#Preview {
    ExampleView()
}
