//
//  NetworkManager.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    /// Fetch posts from network
    /// - Parameters:
    ///   - page: Int
    ///   - limit: Int
    ///   - completion: provide response of API in completion
    func fetchPosts(page: Int, limit: Int, completion: @escaping (Result<[PostModel], Error>) -> Void) {
        let urlString = "\(baseURL)?_page=\(page)&_limit=\(limit)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.success([]))
                return
            }
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
