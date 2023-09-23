//
//  ViewControllerTests.swift
//  collectionViewTests
//
//  Created by Nurmukhanbet Sertay on 23.09.2023.
//

import XCTest
@testable import collectionView

class ViewControllerIntegrationTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = viewController.view
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
    }
    
    func testImageLoading() {
        let mockAPIManager = MockAPIManager()
        viewController.apiManager = mockAPIManager
        
        viewController.loadImages()
        
        sleep(5)
    
        for image in viewController.images {
            XCTAssertNotNil(image)
        }
        
        XCTAssertTrue(viewController.collectionView.numberOfItems(inSection: 0) > 0)
    }
}

class MockAPIManager: APIManager {
    override func loadImages(id: Int, completion: @escaping (UIImage?) -> Void) {
        let sampleImage = UIImage(named: "sampleImage")
        completion(sampleImage)
    }
}
