//
//  PhotosViewController.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - Outlet Declaration
    @IBOutlet weak var collectionView: UICollectionView?
    
    //MARK: - Variable Declaration
    var selectedAlbumId: Int = 0
    private let viewModel: PhotosViewModel = PhotosViewModel(networkService: NetworkService.shared)
    
    //MARK: - View Controller life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Photos"
    }
    //MARK: - Initialization
    func initialization(){
        self.fetchPhotos()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView?.setCollectionViewLayout(layout, animated: true)
    }
    
    //MARK: - API Call
    private func fetchPhotos() {
        viewModel.fetchPhotos(forAlbumId: selectedAlbumId) { [weak self] error in
            if let error = error {
                // Handle the error
                print("Error fetching photos: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self?.collectionView?.reloadData()
                    
                }
            }
        }
    }
}

//MARK: - UICollectionView Delegate & DataSource methods

extension PhotosViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.photoCollectionCell, for: indexPath) as! PhotoCollectionViewCell
        let photo = viewModel.photo(at: indexPath.item)
        cell.configure(with: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = MainStoryboard.instantiateViewController(withIdentifier: Identifiers.detailVC) as! DetailViewController
        detailVC.photoURL = viewModel.photo(at: indexPath.item).url ?? ""
        navigationController?.present(detailVC, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: widthPerItem - 8)
    }
    
}
