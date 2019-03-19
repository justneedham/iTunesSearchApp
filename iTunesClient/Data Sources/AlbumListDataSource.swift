//
// Created by Justin Needham on 2019-03-17.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {

    private var albums: [Album]

    init(albums: [Album]) {
        self.albums = albums
        super.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell

        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator

        return albumCell
    }

    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }

    func update(with albums: [Album]) {
        self.albums = albums
    }
}
