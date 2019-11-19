//
//  RouterTests.swift
//  CleanSwiftExampleTests
//
//  Created by Renan Trapp Silva on 26/09/19.
//  Copyright © 2019 Santander Empresas. All rights reserved.
//

import XCTest
@testable import CleanSwiftExample

class RouterTests: XCTestCase {
    var router: RouterModules!
    private var routerStructSpy: RouterStructTest!
    
    override func setUp() {
        super.setUp()
        
        routerStructSpy = RouterStructTest()
        router = RouterModules(navigation: UINavigationController(), routerModule: routerStructSpy)
    }

    func testStart() {
        router.start()
        
        XCTAssert(routerStructSpy.shouldOpenVC)
        routerStructSpy.shouldOpenVC = false
    }
    
    func testNext() {
        router.openNextViewController(with: routerStructSpy)
        
        XCTAssert(routerStructSpy.shouldOpenVC)
        routerStructSpy.shouldOpenVC = false
    }
    
    func testExit() {
        router.exitRouter()
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
}


private class RouterStructTest: RouterActionProtocol {
    var shouldOpenVC = false
    
    func openViewController(in: Router) -> UIViewController {
        shouldOpenVC = true
        
        return UIViewController()
    }
}
