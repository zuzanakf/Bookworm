//
//  ContentView.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    // for swift data
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    // for sheet
    @State private var showAddBookSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        // what it will look like on main page
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Bookworm"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showAddBookSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showAddBookSheet) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
