//
//  ExempleFeatureRouter.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

protocol ExempleFeatureRouterProtocol {
    func startRouter() -> UIViewController
    func openNextVC() -> UIViewController
}

final class ExempleFeatureRouter: ExempleFeatureRouterProtocol {
    func startRouter() -> UIViewController {
        let router = self
        let view = ExempleFeatureViewController(router: router)
        let service = ExempleFeatureService()
        let interactor = ExempleFeatureInteractor(service: service)
        view.setInteractor(interactor)
        let presenter = ExempleFeaturePresenter(view: view)
        interactor.setPresenter(presenter: presenter)
    
        return view
    }
    
    func openNextVC() -> UIViewController {
        return UIViewController()
    }
}

