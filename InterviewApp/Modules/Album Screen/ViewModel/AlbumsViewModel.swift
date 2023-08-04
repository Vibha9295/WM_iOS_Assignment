//
//  AlbumsViewModel.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import Foundation
class AlbumsViewModel {
    
    //MARK: - Variable Declaration
    
    private let networkService: NetworkService
    private var albums: [AlbumModel] = []
    
    //MARK: - Initialization
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchAlbums(completion: @escaping (Error?) -> Void) {
        networkService.fetchAlbums { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albums = albums
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfAlbums() -> Int {
        return albums.count
    }
    
    func album(at index: Int) -> AlbumModel {
        return albums[index]
    }
}
