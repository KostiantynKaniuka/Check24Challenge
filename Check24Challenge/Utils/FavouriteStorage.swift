//
//  FavouriteStorage.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

final class FavouriteStorage: ObservableObject {
    private let key = "favlist"
    
     @Published private(set) var favourites: Set<Int> = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }

    private func save() {
        let favouritesArray = Array(favourites)
        UserDefaults.standard.set(favouritesArray, forKey: key)
    }

    private func load() {
        if let favouritesArray = UserDefaults.standard.array(forKey: key) as? [Int] {
            favourites = Set(favouritesArray)
        }
    }

    func contain(_ product: Product) -> Bool {
        favourites.contains(product.id)
    }
    
    func add(_ product: Product) {
        favourites.insert(product.id)
        objectWillChange.send()
    }
    
    func remove(_ product: Product) {
        favourites.remove(product.id)
        objectWillChange.send()
    }
}
