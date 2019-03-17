//
// Created by Justin Needham on 2019-03-17.
// Copyright (c) 2019 Treehouse Island. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName

        let timeInSeconds = song.trackTime / 1000
        let minutes = timeInSeconds / 60 % 60
        let seconds = timeInSeconds % 60

        self.runtime = "\(minutes): \(seconds)"
    }
}