//
//  Check24ChallengeApp.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

@main
struct Check24ChallengeApp: App {
    @StateObject private var modelData = ListViewModel(networkManager: NetworkManager())
    @StateObject private var favourites = FavouriteStorage()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(favourites)
        }
    }
}
