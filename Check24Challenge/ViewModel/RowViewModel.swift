//
//  RowViewModel.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

final class RowViewModel: ObservableObject {
    let product: Product
    let imageURL: URL

    init(product: Product) {
        self.product = product
        self.imageURL = URL(string: product.imageURL)!
        
    }
}
