//
//  PostView.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import SwiftUI

struct PostListView: View {
    // MARK: - Properties
    @StateObject private var viewModel = PostListViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    // Navigate to PostDetailView
                    NavigationLink(destination: PostDetailView(post: post)) {
                        Post(post: post)
                        .padding()
                    }
                    .onAppear {
                        // Apply paggination logic to fetch next 10 post
                        if post == viewModel.posts.last {
                            viewModel.fetchPosts()
                        }
                    }
                }
                if viewModel.isFetching {
                    ProgressView() // Show progressview when fetching data from network
                }
            }
            .navigationTitle(StringConstants.postList) // Show navigation title
        }
        .onAppear {
            // call fetch posts API
            viewModel.fetchPosts()
        }
    }
}
