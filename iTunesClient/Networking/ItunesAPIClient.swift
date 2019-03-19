//
// Created by Justin Needham on 2019-03-18.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()

    func searchForArtists(withTerm term: String, completion: @escaping ([Artist]?, ItunesError?) -> Void) {
        let endpoint = iTunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))

        performRequest(with: endpoint) { results, error in
            guard let results = results else {
                completion([], nil)
                return
            }

            let artists = results.flatMap { Artist(json: $0) }
            completion(artists, nil)
        }
    }

    func lookupArtist(withId id: Int, completion: @escaping (Artist?, ItunesError?) -> Void) {
        let endpoint = iTunes.lookup(id: id, entity: MusicEntity.album)
        performRequest(with: endpoint) { results, error in
            guard let results = results else {
                completion(nil, error)
                return
            }

            guard let artistInfo = results.first else {
                completion(nil, .jsonParsingFailure(message: "Results does not contain artist info"))
                return
            }

            guard let artist = Artist(json: artistInfo) else {
                completion(nil, .jsonParsingFailure(message: "Could not parse artist information"))
                return
            }

            let albumResults = results[1..<results.count]
            let albums = albumResults.flatMap { Album(json: $0)}

            artist.albums = albums
            completion(artist, nil)
        }
    }

    typealias Results = [[String: Any]]

    private func performRequest(with endpoint: Endpoint, completion: @escaping (Results?, ItunesError?) -> Void) {
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }

                guard let results = json["results"] as? [[String: Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                completion(results, nil)
            }
        }
        task.resume()
    }
}