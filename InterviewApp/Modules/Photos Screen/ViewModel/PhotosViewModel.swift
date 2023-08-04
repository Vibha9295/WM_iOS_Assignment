//
//  PhotosViewModel.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import Foundation
class PhotosViewModel {
    
    //MARK: - Variable Declaration
    private let networkService: NetworkService
    private var photos: [PhotoModel] = []
    
    //MARK: - Initialization
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchPhotos(forAlbumId albumId: Int, completion: @escaping (Error?) -> Void) {
        networkService.fetchPhotos(albumId: albumId) { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfPhotos() -> Int {
        return photos.count
    }
    
    func photo(at index: Int) -> PhotoModel {
        return photos[index]
    }
}
