//
//  ViewController.swift
//  iTunesClient
//
//  Created by Screencast on 3/30/17.
//  Copyright © 2017 Treehouse Island. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let searchEndpoint = iTunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        let lookupEndpoint = iTunes.lookup(id: 159260351, entity: MusicEntity.album)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

