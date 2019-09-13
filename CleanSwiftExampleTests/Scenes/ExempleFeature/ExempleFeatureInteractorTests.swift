//
//  ExempleFeatureInteractorTests.swift
//  CleanSwiftExampleTests
//
//  Created by Renan Trapp Silva on 13/09/19.
//  Copyright © 2019 Santander Empresas. All rights reserved.
//

import XCTest
@testable import CleanSwiftExample

fileprivate var presenter: PresentSpy = PresentSpy()

class ExempleFeatureInteractorTests: XCTestCase {
    var interactor: ExempleFeatureInteractor!
    private var service: ServiceSpy!
    
    
    override func setUp() {
        super.setUp()
        
        self.service = ServiceSpy()
        self.interactor = ExempleFeatureInteractor(service: service)
        interactor.setPresenter(presenter: presenter)
    }

    func testPassData() {
        self.interactor.getInfo()
        let delayExpectation = expectation(description: "Waiting...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 2)
        
        XCTAssert(presenter.shouldPassData)
        XCTAssert(service.shouldGetObject)
        XCTAssert(presenter.shouldPassData)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

private class ServiceSpy: ExempleFeatureServiceProtocol {
    var shouldGetObject = false
    
    func getObjects(completion: @escaping ([String]) -> Void) {
        shouldGetObject = true
        
        completion(["test"])
    }
}

private class PresentSpy: ExempleFeaturePresenterProtocol {
    var shouldPassData = false
    
    func passObject(object: [String]) {
        shouldPassData = true
    }
}
