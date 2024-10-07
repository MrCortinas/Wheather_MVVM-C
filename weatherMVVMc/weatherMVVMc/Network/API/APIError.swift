//
//  APIError.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/6/24.
//

import Foundation
///use gor error traking 
enum APIError: Error, LocalizedError {
    case unknown
    case apiError(reason: String)
    case parcerError(reason: String)
    case networkError(from: Error)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case let .apiError(reason: reason), let .parcerError(reason):
            return reason
        case let .networkError(from):
            return from.localizedDescription
        }
    }
}
