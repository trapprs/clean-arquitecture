//
//  ExempleFeatureRouter.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

protocol ModuleScenes {}

class PaymentModule: FlowActionProtocol {
    private var flow: Flow?
    private var navigation: UINavigationController?
    
    func openViewController<T>(in flow: Flow, moduleScenes: T) {
        guard let scene = moduleScenes as? Scenes.Payment else { return }
       
        switch scene {
        case .sceneOne:
            let view = openFirstScene()
            
            self.navigation?.pushViewController(view, animated: true)
        case .sceneTwo:
            let storyboard = UIStoryboard(name: "TestStoryboard", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TestStoryboardViewController") as! TestStoryboardViewController
            let interactor = TestStoryboardInteractor()
            destinationVC.set(flow: flow)
            destinationVC.set(interactor: interactor)
            self.navigation?.present(destinationVC, animated: true)
        }
    }
    
    func start(flow: Flow) {
        self.flow = flow
        let view = openFirstScene()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.window = window
        self.navigation = UINavigationController(rootViewController: view)
        window.rootViewController = navigation
        
        window.makeKeyAndVisible()
    }
    
    private func openFirstScene() -> UIViewController {
        guard let flow = self.flow else { return UIViewController() }
        
        let view = ExempleFeatureViewController(flow: flow)
        let service = ExempleFeatureService2()
        let interactor = ExempleFeatureInteractor(service: service)
        view.setInteractor(interactor)
        let presenter = ExempleFeaturePresenter(view: view)
        interactor.setPresenter(presenter: presenter)
        
        return view
    }
}

enum Scenes {
    enum Payment {
        case sceneOne
        case sceneTwo
    }
}
