//
//  ListModel.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

//MARK: - ProductListResponse
struct ProductListResponse: Codable {
    let header: Header
    let filters: [String]
    let products: [Product]
}
//MARK: - Header
struct Header: Codable {
    let headerTitle, headerDescription: String
}

//MARK: - Product
struct Product: Codable, Identifiable {
    let name: String
    let id: Int
    let imageURL: String
    let available: Bool
    let releaseDate: Int
    let description, longDescription: String
    let rating: Double
    let colorCode: String?
    let price: Price
    
    var priceFormatted: String {
        String(format: "%.2f \(price.currency.rawValue)", price.value)
    }
    
    var dateFormatted: String {
        let date = Date(timeIntervalSince1970: TimeInterval(releaseDate))
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        return dateFormatter.string(from: date)
    }
}

//MARK: - Price
struct Price: Codable {
    let value: Double
    let currency: Currency
}
//MARK: - Currency
enum Currency: String, Codable {
    case euro = "EUR"
}
