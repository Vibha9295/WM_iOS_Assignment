//
//  InterviewAppTests.swift
//  InterviewAppTests
//
//  Created by Tulai, Andrei on 10/11/18.
//  Copyright © 2018 Tulai, Andrei. All rights reserved.
//

import XCTest
@testable import InterviewApp

class InterviewAppTests: XCTestCase {
    var viewModel: AlbumsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = AlbumsViewModel(networkService: NetworkService())
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func setUpWithError() throws {
        let networkService = NetworkService()
        viewModel = AlbumsViewModel(networkService: networkService)
    }
    override func tearDown() {
        viewModel = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testFetchAlbums() {
        let expectation = XCTestExpectation(description: "Fetch albums")
        
        viewModel.fetchAlbums { error in
            XCTAssertNil(error, "Error fetching albums")
            XCTAssertEqual(self.viewModel.numberOfAlbums(), 100, "Incorrect number of albums")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
