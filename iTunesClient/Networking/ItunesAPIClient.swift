//
// Created by Justin Needham on 2019-03-18.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()

    func searchForArtists(withTerm term: String, completion: @escaping ([Artist]?, ItunesError?) -> Void) {
        let endpoint = iTunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))

        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }

                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }

                let artists = results.flatMap { Artist(json: $0) }

                completion(artists, nil)
            }
        }
        task.resume()
    }
}