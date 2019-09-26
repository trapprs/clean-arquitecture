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
    private var router: RouterSpy!
    
    override func setUp() {
        super.setUp()
        self.router = RouterSpy(navigation: UINavigationController(), routerModule: RouterStructTest())
        
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
    }
    
    func testPresenter() {
        interactor.setPresenter(presenter: presenter)
        
        XCTAssert(interactor.couldSetPresenter)
    }
    
    func testFailureView() {
        let v = ExempleFeatureViewController(coder: NSCoder())
        XCTAssertNil(v, "Error")
    }
    
    func testIBOutletPrivate() {
        viewController.testPrivateMethods(UIButton(frame: .zero))
        
        router.openNextViewController(with: RouterStructTest())
        XCTAssert(router.shouldPassToNextVC)
        
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

private class RouterSpy: Router {
    var shouldPassToNextVC = false
    var shouldStart = false
    var shouldExit = false
    
    func start() {
        shouldStart = true
    }
    
    required init(navigation: UINavigationController?, routerModule: RouterActionProtocol) {
        
    }
    
    func openNextViewController(with sceneName: RouterActionProtocol) {
        shouldPassToNextVC = true
    }
    
    func exitRouter() {
        shouldExit = true
    }
}

private class RouterStructTest: RouterActionProtocol {
    var shouldOpenVC = false
    
    func openViewController(in router: Router) -> UIViewController {
        shouldOpenVC = true
        
        return UIViewController()
    }
}
