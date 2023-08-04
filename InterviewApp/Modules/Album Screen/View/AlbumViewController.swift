//
//  AlbumViewController.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit

class AlbumViewController: UIViewController, Alertable  {
    
    //MARK: - Outlet Declaration
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - Variable Declaration
    private let viewModel: AlbumsViewModel = AlbumsViewModel(networkService: NetworkService.shared)
    
    //MARK: - View Controller life cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Albums"
        
    }
    //MARK: - Initialization
    func initialization(){
        self.fetchAlbums()
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
        
        
    }
    //MARK: - Check the Internet
    
    @objc func showOfflineDeviceUI(notification: Notification) {
        if NetworkMonitor.shared.isConnected {
            print("Connected")
        } else {
            showAlert(title: Message.noInternet, message: Message.requireInternet, preferredStyle: .alert)
            
            print("Not connected")
        }
    }
    //MARK: - API Call
    
    private func fetchAlbums() {
        viewModel.fetchAlbums { [weak self] error in
            if let error = error {
                // Handle the error
                print("Error fetching albums: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                    
                }
            }
        }
    }
}

//MARK: - UITableview Delegate & DataSource methods

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfAlbums()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.albumCell, for: indexPath) as? AlbumCell
        let album = viewModel.album(at: indexPath.row)
        cell?.configure(with: album)
        return cell ?? AlbumCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MainStoryboard.instantiateViewController(withIdentifier: Identifiers.photoVC) as! PhotosViewController
        detailVC.selectedAlbumId = viewModel.album(at: indexPath.row).userId ?? 0
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
