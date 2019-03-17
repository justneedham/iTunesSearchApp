//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Justin Needham on 2019-03-17.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {

    private var data = [Artist]()

    override init() {
        super.init()
    }

    func update(with artists: [Artist]) {
        data = artists
    }

    // MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        let artist = data[indexPath.row]
        cell.textLabel?.text = artist.name
        return cell
    }

    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
}
