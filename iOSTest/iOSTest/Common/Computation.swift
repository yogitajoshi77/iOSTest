//
//  Computation.swift
//  iOSTest
//
//  Created by Yogi on 30/05/24.
//

import Foundation

/// Function for computing some heavy operation
/// - Parameters:
///   - post: PostModel
///   - completion: provide some results in completion
func performHeavyComputation(for post: PostModel, completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        let startTime = Date()
        // Perform heavy computation here...
        let result = "Computed Data"
        let endTime = Date()
        let computationTime = endTime.timeIntervalSince(startTime)
        print("Computation time: \(computationTime) seconds")
        
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
