//
//  ExempleFeatureViewController.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

protocol ExempleFeatureDisplay: AnyObject {
    func setInteractor(_ interactor: ExempleFeatureInteractorProtocol)
    func displayInfo(object: [String])
}

final class ExempleFeatureViewController: UIViewController {
    private var interactor: ExempleFeatureInteractorProtocol?
    private var router: ExempleFeatureRouterProtocol?
    
    init(router: ExempleFeatureRouterProtocol) {
        self.router = router
        
        super.init(nibName: "ExempleFeatureViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.getInfo()
    }
}

// MARK: - ExempleFeatureDisplay
extension ExempleFeatureViewController: ExempleFeatureDisplay {
    func displayInfo(object: [String]) {
        if let vc = router?.openNextVC() {
            present(vc, animated: true)
        }
    }
    
    func setInteractor(_ interactor: ExempleFeatureInteractorProtocol) {
        self.interactor = interactor
    }
}
