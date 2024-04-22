//
//  ProductListView.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI
import Combine

struct ProductListView: View {
    @EnvironmentObject var productListVM: ListViewModel
    @EnvironmentObject var favouriteStorage: FavouriteStorage
    
    @State private var category: ProductCategory = .all
    @State private var isDataLoading: Bool = true
    @State private var isApiError: Bool = false
    @State private var isLoadingSubscriber: AnyCancellable?
    @State private var viewDidLoad: Bool = false
    
    var body: some View {
        NavigationView {
        
                VStack {
                    HeaderView(isError: $isApiError, category: $category)
                    if $isDataLoading.wrappedValue == true {
                        ProgressView()
                    }
                    List {
                        if $isApiError.wrappedValue == false  {
                            ForEach(productListVM.assembledProductList) { product in
                                if product.available {
                                    NavigationLink {
                                        DetailView(product: product)
                                    } label: {
                                        AvailableProductListRow(productRowVM: RowViewModel(product: product))
                                            .offset(x: 8)
                                        
                                    }
                                } else {
                                    NavigationLink {
                                        DetailView(product: product)
                                    } label: {
                                        NotAvailableProductRow(productRowVM: RowViewModel(product: product))
                                            .offset(x: 8)
                                    }
                                }
                            }
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            
                        } else {
                            ErrorView(refreshAction: {productListVM.showProduct(in: category)})
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .refreshable {
                        productListVM.showProduct(in: category)
                    }
                    .onAppear(perform: {
                        if viewDidLoad == false {
    
                            productListVM.showProduct(in: category)
                            viewDidLoad = true
                        }
                        productListVM.arrangeProducts(category: category)
                    })
                    
                    
                    .onChange(of: category) { oldValue, newValue in
                        if newValue == .favourite {
                            productListVM.setUpFavourites(favouriteStorage.favourites)
                        }
                        productListVM.arrangeProducts(category: category)
                        print(productListVM.assembledProductList.count)
                        
                    }
                    .onReceive(productListVM.$isError) { isError in
                        
                        self.isApiError = isError
                    }
                    .onReceive(productListVM.$isDataLoading) { loading in
                        self.isDataLoading = loading
                    }
                    FooterView()
                }
            .navigationBarTitle("Check24", displayMode: .inline)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("CHECK24")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                }
           
            }
        }
            .headerProminence(.increased)
           
            
    }
}

#Preview {
    let dataList = ListViewModel(networkManager: NetworkManager())
    return ProductListView()
        .environmentObject(dataList)
        .environmentObject(FavouriteStorage())
}
