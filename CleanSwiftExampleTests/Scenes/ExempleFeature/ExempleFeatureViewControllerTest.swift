//
//  ExempleFeatureInteractorTest.swift
//  CleanSwiftExampleTests
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import XCTest
@testable import CleanSwiftExample

class ExempleFeatureViewControllerTest: XCTestCase {
    var viewController: ExempleFeatureViewController!
    private var interactor: ExempleFeatureInteractorSpy!
    private var presenter: ExempleFeaturePresenterSpy!
    private var router: Router!
    
    override func setUp() {
        super.setUp()
        self.router = Router()
        self.viewController = ExempleFeatureViewController(router: router)
        self.interactor = ExempleFeatureInteractorSpy()
        self.presenter = ExempleFeaturePresenterSpy()
    }

    func testGetInfo() {
        viewController.setInteractor(interactor)
        
        viewController.viewDidLoad()
        
        XCTAssert(interactor.couldGetInfo)
    }
    
    func testDisplayInfo() {
        viewController.setInteractor(interactor)
        
        viewController.displayInfo(object: ["test"])
        
        XCTAssert(router.shouldPassRouter)
    }
    
    func testPresenter() {
        interactor.setPresenter(presenter: presenter)
        
        XCTAssert(interactor.couldSetPresenter)
    }
    
    func testFailureView() {
        let v = ExempleFeatureViewController(coder: NSCoder())
        XCTAssertNil(v, "Error")
    }
    
    override func tearDown() {
       super.tearDown()
    }
}

private class ExempleFeatureInteractorSpy: ExempleFeatureInteractorProtocol {
    var couldSetPresenter = false
    var couldGetInfo = false
    
    func setPresenter(presenter: ExempleFeaturePresenterProtocol) {
        couldSetPresenter = true
    }
    
    func getInfo() {
        couldGetInfo = true
    }
}

private class ExempleFeaturePresenterSpy: ExempleFeaturePresenterProtocol {
    func passObject(object: [String]) {
    }
}

private class Router: ExempleFeatureRouterProtocol {
    var shouldPassRouter = false
    func startRouter() -> UIViewController {
        return UIViewController()
    }
    
    func openNextVC() -> UIViewController {
        shouldPassRouter = true
        return UIViewController()
    }
}
