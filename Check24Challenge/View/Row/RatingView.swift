//
//  RatingView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct RatingView: View {
    let value: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: imageName(for: index, value: value))
            }
        }
        .foregroundColor(.yellow)
    }
    
    private func imageName(for starIndex: Int, value: Double) -> String {
        // Version A
        if value >= Double(starIndex + 1) {
            return "star.fill"
        }
        else if value >= Double(starIndex) + 0.5 {
            return "star.leadinghalf.filled"
        }
        else {
            return "star"
        }
    }
}

#Preview {
    RatingView(value: 2.5)
}
