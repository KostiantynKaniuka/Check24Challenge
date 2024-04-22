//
//  ProductMockData.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

final class ProductMockData {
   
    var mock = Product(name: "Nirvana", id: 1, imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", available: true, releaseDate: 228, description: shortDescription, longDescription: longDescription, rating: 3.5, colorCode: colorCode, price: Price.init(value: 201, currency: Currency(rawValue: "EUR")!))
    
    var mock1 = Product(name: "Nirvana", id: 1, imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/04.png", available: false, releaseDate: 228, description: shortDescription, longDescription: longDescription, rating: 3.5, colorCode: "ffCDD2", price: Price.init(value: 201, currency: Currency(rawValue: "EUR")!))
    
    var mock2 = Product(name: "Nirvana", id: 1, imageURL: "https://kredit.check24.de/konto-kredit/ratenkredit/nativeapps/imgs/08.png", available: true, releaseDate: 228, description: shortDescription, longDescription: longDescription, rating: 3.5, colorCode: colorCode, price: Price.init(value: 201, currency: Currency(rawValue: "EUR")!))
}

var colorCode = "C8E6C9"
var shortDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
var longDescription = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""
