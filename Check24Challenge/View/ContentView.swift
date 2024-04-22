//
//  ContentView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ProductListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ListViewModel(networkManager: NetworkManager()))
}
