//
//  AlbumAPITests.swift
//  InterviewAppTests
//
//  Created by Mac on 24/07/23.
//

import XCTest
@testable import InterviewApp

class AlbumAPITests: XCTestCase {
    var viewModel: AlbumsViewModel!

    override func setUpWithError() throws {
        let networkService = NetworkService()
        viewModel = AlbumsViewModel(networkService: networkService)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
