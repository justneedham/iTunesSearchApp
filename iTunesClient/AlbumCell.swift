//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Justin Needham on 2019-03-17.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    static let reuseIdentifier = "AlbumCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with viewModel: AlbumCellViewModel) {
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate

        if let artwork = viewModel.artwork {
            artworkView.image = artwork
        }
    }
}
