//
//  NotAvailableProductRow.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI
import Kingfisher

struct NotAvailableProductRow: View {
    @StateObject var productRowVM: RowViewModel
    
    var body: some View {
            HStack(spacing: 0) {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    HStack() {
                        Text(productRowVM.product.name)
                    }
                    Text(productRowVM.product.description)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .frame(width: 250, height: 50, alignment: .leading)
                        .offset(y: -5)
        
                        RatingView(value: productRowVM.product.rating)
                        .frame(height: 1)
                        .offset(x: -4)
                }
                KFImage(productRowVM.imageURL)
                    .resizable()
                .frame(width: 80, height: 80)
                .background(Color(hex: productRowVM.product.colorCode ?? "#000000"))
                .offset(x:8)
                Spacer()
            }
            .offset(x: -4)
            .padding()
            .frame(height: 120)
            .border(.gray)
            .padding(8)
        }
       
    }


#Preview {
    NotAvailableProductRow(productRowVM: RowViewModel(product: ProductMockData().mock))
}
