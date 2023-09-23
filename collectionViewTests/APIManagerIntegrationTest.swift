//
//  APIManagerIntegrationTest.swift
//  collectionViewTests
//
//  Created by Nurmukhanbet Sertay on 23.09.2023.
//

import XCTest
@testable import collectionView

class APIManagerIntegrationTests: XCTestCase {
    
    func testLoadImages() {
        let apiManager = APIManager()
        let expectation = XCTestExpectation(description: "Load Images")
        
        apiManager.loadImages(id: 1) { image in
            XCTAssertNotNil(image, "Image should not be nil")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
    }
    
    func testLoadImageContent() {
        let apiManager = APIManager()
        let imageUrl = "https://via.placeholder.com/150" // Replace with a valid image URL
        let expectation = XCTestExpectation(description: "Load Image Content")
        
        apiManager.loadImageContent(url: imageUrl) { image in
            XCTAssertNotNil(image, "Image should not be nil")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
    }
}
