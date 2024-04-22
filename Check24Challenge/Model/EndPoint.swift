//
//  EndPoint.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

enum EndPoint: String {
    case productList = "https://app.check24.de/products-test.json"
    case webLink = "https://m.check24.de/rechtliche-hinweise?deviceoutput=app"
    case mockErrorLink = "nolink"
    
    var url: URL{
        URL(string: self.rawValue)!
    }
    
}
