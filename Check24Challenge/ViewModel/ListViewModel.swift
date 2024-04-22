//
//  ListViewModel.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import Foundation

public enum ProductCategory {
    case all
    case available
    case favourite
}

final class ListViewModel: ObservableObject {
    
    @Published private(set) var headerSection: Header?
    @Published private(set) var assembledProductList: [Product] = []
    @Published private(set) var isDataLoading: Bool = true
    @Published private(set) var isError: Bool = false
    @Published var category: ProductCategory = .all
    
    private var networkManager: NetworkManager
    private var allProducts = [Product]()
    private var favourites: Set<Int> = []
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        
    }
    
    func showProduct(in category: ProductCategory = .all) {
        isDataLoading = true
      
             fetchProducts(category: category)
    }
    
    func arrangeProducts(category: ProductCategory) {
        self.category = category
        switch category {
        case .all:
            showAllProducts()
        case .available:
            showAvailableProducts()
        case .favourite:
            showFavoriteProducts()
        }
    }
    
    func setUpFavourites(_ values: Set<Int>) {
        favourites = values
    }
}



//MARK: - API CALL
private extension ListViewModel {
    
    func fetchProducts(category: ProductCategory) {
        let productURL = EndPoint.productList.url
        let errorMockURL = EndPoint.mockErrorLink.url
        
        let useErrorMockURL = Int.random(in: 1...2) == 1 // randomiser for an error simulation
        
        let urlToUse = useErrorMockURL ? errorMockURL : productURL
        
        networkManager.getRequest(with: urlToUse) { [weak self] (response: Result<ProductListResponse, Error>) in
            guard let self = self else {return}
            switch response {
            case .success(let response):
                DispatchQueue.main.async {
                    self.isDataLoading = false
                    self.isError = false
                    self.headerSection = response.header
                    self.allProducts = response.products
                    self.arrangeProducts(category: category)
          
                    print("✅")
                }
                return
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.isDataLoading = false
           
                    self.isError = true
                    print("❌")
                }
                return
            }
        }
    }
    
    func showAllProducts() {
        assembledProductList = allProducts
    }
    
    func showAvailableProducts() {
        let filtered = allProducts.filter { product in
            return product.available == true
        }
        assembledProductList = filtered
    }
    
    func showFavoriteProducts() {
        let favouriteProducts = allProducts.filter { favourites.contains($0.id) }
        assembledProductList = favouriteProducts
    }
}
