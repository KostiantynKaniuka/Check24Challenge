//
//  DetailView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @EnvironmentObject var favourites: FavouriteStorage
    @EnvironmentObject var listVM: ListViewModel
    
    @State var product: Product
    
    var body: some View {
        ScrollView {
            HStack() {
                KFImage(URL(string: product.imageURL)!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(Color(hex: product.colorCode ?? "#000000"))
                    .offset(x:16)
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                    HStack {
                        if product.available {
                            Text("Preis:")
                            Text(product.priceFormatted)
                                .foregroundStyle(.secondary)
                            .font(.system(size: 14))}
                    }
                    HStack {
                        RatingView(value: product.rating)
                        Spacer()
                        Text(product.dateFormatted)
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
                Spacer()
            }
            .frame(height: 120)
            .padding(16)
            VStack(spacing: 16) {
                
                Text(product.description)
                    .padding(.horizontal, 32)
                //MARK: - Fav Button
                Button {
                    if favourites.contain(product) {
                        favourites.remove(product)
                    } else {
                        favourites.add(product)
                    }
                    listVM.setUpFavourites(favourites.favourites)
                } label: {
                    Text(favourites.contain(product) ? "Vormerken" : "Vergessen")
                    
                        .padding(EdgeInsets(top: 8, leading: 100, bottom: 8, trailing: 100))
                    
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(8)
                }
                HStack {
                    Text("Beschreibung")
                        .bold()
                    Spacer()
                }
                .offset(x: 48)
                Text(product.longDescription)
                    .padding(.horizontal, 42.0)
            }
            FooterView()
                .padding()
        }
    }
}


#Preview {
    DetailView(product: ProductMockData().mock)
        .environmentObject(FavouriteStorage())
        .environmentObject(ListViewModel(networkManager: NetworkManager()))
}

