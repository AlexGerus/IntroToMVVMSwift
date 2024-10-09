//
//  APError.swift
//  IntroToMVVMSwift
//
//  Created by Alexander Gerus on 24.04.2023.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
