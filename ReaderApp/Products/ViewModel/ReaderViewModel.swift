//
//  ReaderViewModel.swift
//  ReaderApp
//
//  Created by Normsoftware on 7/23/25.
//


import Foundation


class ProductViewModel {
    private(set) var products: [Product] = []
    private(set) var filteredProducts: [Product] = []

    func fetchProducts(completion: @escaping () -> Void) {
        NetworkClient.shared.fetchProducts { result in
            switch result {
            case .success(let products):
                self.products = products
                self.filteredProducts = products // Initially show all
                completion()
            case .failure(let error):
                print("Error fetching products: \(error.localizedDescription)")
            }
        }
    }

    func filterProducts(with query: String) {
        if query.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter {
                $0.title.lowercased().contains(query.lowercased()) ||
                $0.description.lowercased().contains(query.lowercased())
            }
        }
    }
}

