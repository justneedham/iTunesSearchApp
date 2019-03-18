//
// Created by Justin Needham on 2019-03-18.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}