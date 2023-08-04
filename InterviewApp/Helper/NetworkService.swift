import Foundation
// MARK: - API Integration with URLSession

class NetworkService {
    static var shared = NetworkService()
    
    func fetchAlbums(completion: @escaping (Result<[AlbumModel], Error>) -> Void) {
        guard let url = URL(string: WebServiceURLs.albumURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let albums = try JSONDecoder().decode([AlbumModel].self, from: data!)
                completion(.success(albums))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchPhotos(albumId: Int, completion: @escaping (Result<[PhotoModel], Error>) -> Void) {
        guard let url = URL(string: "\(WebServiceURLs.photoURL)\(albumId)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let photos = try JSONDecoder().decode([PhotoModel].self, from: data!)
                completion(.success(photos))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

