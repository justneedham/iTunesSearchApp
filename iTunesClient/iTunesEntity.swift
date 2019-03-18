//
// Created by Justin Needham on 2019-03-17.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import Foundation

protocol ItunesEntity: QueryItemProvider {
    var entityName: String { get }
}

extension ItunesEntity {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "entity", value: entityName)
    }
}

enum MusicEntity: String {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
}

extension MusicEntity: ItunesEntity {
    public var entityName: String {
        return self.rawValue
    }
}