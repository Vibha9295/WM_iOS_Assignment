//
//  NetworkMonitor.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import Foundation

import Network
// MARK: - Check the Internet connectivity

final class NetworkMonitor: ObservableObject {
    
    static let shared = NetworkMonitor()
    let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
    var monitor = NWPathMonitor()
    @Published public private(set) var isConnected: Bool = false
    private var hasStatus: Bool = false
    
    init() {
        monitor = NWPathMonitor()
        
    }
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            #if targetEnvironment(simulator)
            if (!self.hasStatus) {
                self.isConnected = path.status == .satisfied
                self.hasStatus = true
            } else {
                self.isConnected = !self.isConnected
            }
            #else
            self.isConnected = path.status == .satisfied
            #endif
            print("isConnected: " + String(self.isConnected))
            
            NotificationCenter.default.post(name: .connectivityStatus, object: nil)
            
        }
        monitor.start(queue: queue)
    }
}
extension Notification.Name {
    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
}

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet
    ]
}
