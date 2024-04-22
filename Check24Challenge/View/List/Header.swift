//
//  Header.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var productListVM: ListViewModel
    
    @Binding var isError: Bool
    @Binding var category: ProductCategory
    
    var body: some View {
        VStack(spacing: 10) {
            Picker("filters", selection: $category) {
                Text("Alle").tag(ProductCategory.all)
                Text("Verfügbar").tag(ProductCategory.available)
                Text("Vorgemerkt").tag(ProductCategory.favourite)
            }
            .disabled(isError)
            .pickerStyle(.segmented)
            .padding(.vertical)
            HStack {
                Text(productListVM.headerSection?.headerTitle ?? "Title")
                Spacer()
            }
            HStack {
                Text(productListVM.headerSection?.headerDescription ?? "Subtitle")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                Spacer()
            }
        }
        .padding()
    }
}
