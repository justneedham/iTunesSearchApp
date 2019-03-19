//
// Created by Justin Needham on 2019-03-17.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {

    private var albums: [Album]

    let pendingOperations = PendingOperations()
    let tableView: UITableView

    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
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

        if album.artworkState == .placeholder {
            downloadArtwork(for: album, atIndexPath: indexPath)
        }

        return albumCell
    }

    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }

    func update(with albums: [Album]) {
        self.albums = albums
    }

    func downloadArtwork(for album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }

        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }

            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }

        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
