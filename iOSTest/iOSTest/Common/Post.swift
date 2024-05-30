//
//  Post.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import SwiftUI

struct Post: View {
    // MARK: - Variables
    var post: PostModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("**ID:** \(post.id)")
                .font(.body)
            Text("**UserID:** \(post.userId)")
                .font(.body)
            Text("**Title:** \(post.title)")
                .font(.body)
            Text("**Body:** \(post.body)")
                .font(.body)
            Spacer()
        }
    }
}
