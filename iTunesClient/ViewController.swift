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
        let endpoint = iTunes.search(term: "taylor swift", media: .music(entity: .musicArtist))
        print(endpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

