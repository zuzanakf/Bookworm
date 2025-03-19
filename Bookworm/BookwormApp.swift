//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//
//added
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // modifier telling swift to make student data availible to whole app
        // first time it runs creates swift data file and in future runs will just load, modelcontainer just tells us where to store data
        // model context - temporary pool of data so we dontcontantly read and write, all apps need it - model container creates this automatically
        // for example use .modelContainer(for: Student.self)
        .modelContainer(for: Book.self)
    }
}
