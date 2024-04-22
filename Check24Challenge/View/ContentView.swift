//
//  ContentView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listVM: ListViewModel
  
    var body: some View {
        ProductListView()
    }
}

#Preview {
   
    ContentView()
        .environmentObject(ListViewModel(networkManager: NetworkManager()))
}
