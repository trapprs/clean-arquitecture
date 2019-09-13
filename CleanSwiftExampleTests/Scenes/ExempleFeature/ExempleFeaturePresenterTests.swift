//
//  ExempleFeaturePresenterTests.swift
//  CleanSwiftExampleTests
//
//  Created by Renan Trapp Silva on 13/09/19.
//  Copyright © 2019 Santander Empresas. All rights reserved.
//

import XCTest
@testable import CleanSwiftExample

class ExempleFeaturePresenterTests: XCTestCase {
    var presenter: ExempleFeaturePresenter!
    private var view: ExempleFeatureDisplaySpy!
    
    override func setUp() {
        super.setUp()
        view = ExempleFeatureDisplaySpy()
        presenter = ExempleFeaturePresenter(view: view)
    }

    func testPassObject() {
        presenter.passObject(object: [""])
        
        XCTAssert(view.couldDisplayInfo)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

private class ExempleFeatureDisplaySpy: ExempleFeatureDisplay {
    var couldSetInteractor = false
    var couldDisplayInfo = false
    
    func setInteractor(_ interactor: ExempleFeatureInteractorProtocol) {
        couldSetInteractor = true
    }
    
    func displayInfo(object: [String]) {
        couldDisplayInfo = true
    }
}

