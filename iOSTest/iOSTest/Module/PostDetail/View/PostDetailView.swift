//
//  PostDetailView.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import SwiftUI

struct PostDetailView: View {
    
    // MARK: - Properties
    let post: PostModel
    @State private var computedData: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Post(post: post)
            Text(computedData)
                .font(.body)
                .padding()
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .onAppear {
            performHeavyComputation(for: post) { result in
                computedData = result
            }
        }
    }
}

