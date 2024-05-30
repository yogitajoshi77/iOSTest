//
//  PostViewModel.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import Foundation

// MARK: - PostListViewModel
class PostListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var posts: [PostModel] = []
    @Published var isFetching = false
    private var currentPage = 1
    
    // MARK: - Function
    /// Fetch posts from network
    func fetchPosts() {
        guard !isFetching else { return }
        isFetching = true
        // Fetch only 10 data at a time
        NetworkManager.shared.fetchPosts(page: currentPage, limit: 10) { [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                switch result {
                case .success(let newPosts):
                    self?.posts.append(contentsOf: newPosts)
                    self?.currentPage += 1
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
}
