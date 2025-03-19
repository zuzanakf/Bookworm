//
//  RatingView.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = "Rating"
    var maxRating: Int = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor: Color = .gray
    var onColor: Color = .yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
            // treats each button seperately so with the form not all are tapped
            .buttonStyle(.plain)
        }
    }
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    //binding needs to be added to preview
    RatingView(rating: .constant(4))
}
