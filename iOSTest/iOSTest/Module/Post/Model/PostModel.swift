//
//  PostModel.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import Foundation

// MARK: - PostModel
struct PostModel: Decodable, Identifiable, Equatable {
    // MARK: - Properties
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
