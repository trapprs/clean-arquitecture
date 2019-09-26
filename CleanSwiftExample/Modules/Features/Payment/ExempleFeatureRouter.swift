//
//  ExempleFeatureRouter.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

enum PaymentModule: RouterActionProtocol {
    case sceneOne
    case sceneTwo
    
    func openViewController(in router: Router) -> UIViewController {
        switch self {
        case .sceneOne:
            let view = ExempleFeatureViewController(router: router)
            let service = ExempleFeatureService()
            let interactor = ExempleFeatureInteractor(service: service)
            view.setInteractor(interactor)
            let presenter = ExempleFeaturePresenter(view: view)
            interactor.setPresenter(presenter: presenter)
            
            return view
        case .sceneTwo:
            let storyboard = UIStoryboard(name: "TestStoryboard", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TestStoryboardViewController") as! TestStoryboardViewController
            let interactor = TestStoryboardInteractor()
            destinationVC.set(router: router)
            destinationVC.set(interactor: interactor)
            
            return destinationVC
        }
    }
}
