//
//  ExempleFeatureRouter.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

protocol ModuleScenes {}

class PaymentModule: RouterActionProtocol {
    internal var moduleScenes: ModuleScenes?
    private var scene: Scenes = .sceneOne
    private var router: Router?
    private var navigation: UINavigationController?
    
    enum Scenes: ModuleScenes {
        case sceneOne
        case sceneTwo
    }
    
    func openViewController(in router: Router, moduleScenes: ModuleScenes) {
        self.scene = moduleScenes as? PaymentModule.Scenes ?? PaymentModule.Scenes.sceneOne
        switch scene {
        case .sceneOne:
            let view = openFirstScene()
            
            self.navigation?.pushViewController(view, animated: true)
        case .sceneTwo:
            let storyboard = UIStoryboard(name: "TestStoryboard", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TestStoryboardViewController") as! TestStoryboardViewController
            let interactor = TestStoryboardInteractor()
            destinationVC.set(router: router)
            destinationVC.set(interactor: interactor)
            self.navigation?.present(destinationVC, animated: true)
        }
    }
    
    func start(router: Router) {
        self.router = router
        let view = openFirstScene()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.window = window
        self.navigation = UINavigationController(rootViewController: view)
        window.rootViewController = navigation
        
        window.makeKeyAndVisible()
    }
    
    private func openFirstScene() -> UIViewController {
        guard let router = self.router else { return UIViewController() }
        
        let view = ExempleFeatureViewController(router: router)
        let service = ExempleFeatureService2()
        let interactor = ExempleFeatureInteractor(service: service)
        view.setInteractor(interactor)
        let presenter = ExempleFeaturePresenter(view: view)
        interactor.setPresenter(presenter: presenter)
        
        return view
    }
}
