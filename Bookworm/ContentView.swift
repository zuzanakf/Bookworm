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
    // sorting data, query
    // for numerical just need \Book.rating
    // in array sort by alphabetical title then author if same title
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    
    ]) var books: [Book]
    
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
                .onDelete(perform: deleteBook)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .navigationTitle(Text("Bookworm"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
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
    // allowing for delete within the actual data
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
