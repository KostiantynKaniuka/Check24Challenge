//
//  ErrorView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct ErrorView: View {
    
    var refreshAction: () -> Void
    
    var body: some View {
        
        HStack(spacing: 0) {
            Spacer()
            Image("warning")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(x:8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Probleme")
                    .offset(y: 4)
                Text("Die Daten konnten nicht geladen werden")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button {
                    refreshAction()
                }
            label: {
                Text("Neuladen")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 80)
                    .foregroundColor(.white)
                    .background(.blue)
                    .offset(y: -4)
                    .fixedSize()
            }
            }
            .padding()
            Spacer()
        }
        .frame(height: 120)
        .border(.gray)
        .padding()
        
    }
}

#Preview {
    ErrorView(refreshAction: {})
}
