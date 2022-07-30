//
//  AppError.swift
//  MyApp
//
//  Created by Manh Pham on 6/29/22.
//

import Foundation

enum AppError: Error {
    case noInternetConnection
    case actionAlreadyPerforming
    case networkError(error: Error)
    case refreshTokenErrorNoToken
}

