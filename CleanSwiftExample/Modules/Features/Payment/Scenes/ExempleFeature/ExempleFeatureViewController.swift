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
    private var router: Router?
    
    init(router: Router) {
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
    
    @IBAction private func buttomNextTapped(_ sender: UIButton) {
        router?.openNextViewController(with: PaymentModule.Scenes.sceneTwo)
    }
}

// MARK: - ExempleFeatureDisplay
extension ExempleFeatureViewController: ExempleFeatureDisplay {
    func displayInfo(object: [String]) {
       print(object)
    }
    
    func setInteractor(_ interactor: ExempleFeatureInteractorProtocol) {
        self.interactor = interactor
    }
}

// MARK: - extension for tests
#if DEBUG
extension ExempleFeatureViewController {
    func testPrivateMethods(_ sender: UIButton) {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            buttomNextTapped(sender)
        }
    }
}
#endif
