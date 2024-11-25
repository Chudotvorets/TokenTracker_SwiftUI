//
//  CoinAPIError.swift
//  TokenTracker
//
//  Created by dev on 25.11.2024.
//

import Foundation

enum CoinAPIErrorModel: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownedError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownedError(error): return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
