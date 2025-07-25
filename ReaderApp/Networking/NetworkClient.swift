//
//  NetworkClient.swift
//  ReaderApp
//
//  Created by Normsoftware on 7/23/25.
//



import Foundation


 class NetworkClient {
    static let shared = NetworkClient()
    private init() {}

    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let response = try JSONDecoder().decode(ProductData.self, from: data)
                completion(.success(response.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



