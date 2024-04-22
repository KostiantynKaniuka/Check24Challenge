//
//  AvailableProductListRow.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI
import Kingfisher

struct AvailableProductListRow: View {
    
    @StateObject var productRowVM: RowViewModel
   
    var body: some View {

        HStack(spacing: 0) {
            Spacer()
            KFImage(productRowVM.imageURL)
                .resizable()
            .frame(width: 80, height: 80)
            .background(Color(hex: productRowVM.product.colorCode ?? "#000000"))
            .offset(x:8)
        
            VStack(alignment: .leading, spacing: 8) {
                HStack() {
                    Text(productRowVM.product.name)
                    Spacer()
                    Text(productRowVM.product.dateFormatted)
                        .font(.system(size: 12))
                        .foregroundStyle(.secondary)

                }
                .offset(y: 10)
                Text(productRowVM.product.description)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .frame(width: 250, height: 50, alignment: .leading)
                
                HStack() {
                    Text("Preis:")
                    Text(productRowVM.product.priceFormatted)
                        .foregroundStyle(.secondary)
                        .font(.system(size: 14))
                       
                    //Spacer()
                    RatingView(value: productRowVM.product.rating)
                        .offset(x: 10)
                       
                }
            }
            .padding()
            Spacer()
        }
        .frame(height: 120)
        .border(.gray)
        .padding(8)
    }
}

#Preview {
    AvailableProductListRow(productRowVM: RowViewModel(product: ProductMockData().mock))
}
