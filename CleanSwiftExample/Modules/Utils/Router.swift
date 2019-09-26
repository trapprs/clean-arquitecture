//
//  Router.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 26/09/19.
//

import UIKit

protocol Router {
    init(navigation: UINavigationController?, routerModule: RouterActionProtocol)
    func start()
    func openNextViewController(with sceneName: RouterActionProtocol)
    func exitRouter()
}

protocol RouterActionProtocol {
    func openViewController(in router: Router) -> UIViewController
}

final class RouterModules: Router {
    private var navigation: UINavigationController?
    private var routerModule: RouterActionProtocol
    
    init(navigation: UINavigationController? = nil, routerModule: RouterActionProtocol) {
        self.navigation = navigation
        self.routerModule = routerModule
    }
    
    func start() {
        navigation?.pushViewController(routerModule.openViewController(in: self), animated: true)
    }
    
    func openNextViewController(with sceneName: RouterActionProtocol) {
        navigation?.pushViewController(sceneName.openViewController(in: self), animated: true)
    }
    
    func exitRouter() {
        navigation?.popToRootViewController(animated: true)
    }
}
