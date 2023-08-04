//
//  Constants.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit
// MARK: - WebService URLs

struct WebServiceURLs {
    static let mainURL = "https://jsonplaceholder.typicode.com/"
    static let albumURL = mainURL + "albums"
    static let photoURL = mainURL + "photos?albumId="
}
struct Identifiers {
    static let photoVC = "PhotosViewController"
    static let detailVC = "DetailViewController"
    static let photoCollectionCell = "PhotoCollectionViewCell"
    static let albumCell = "AlbumCell"
}


struct Message {
    static let noInternet = "No Internet Detected"
    static let requireInternet = "This app requires an Internet connection"
}
let MainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
