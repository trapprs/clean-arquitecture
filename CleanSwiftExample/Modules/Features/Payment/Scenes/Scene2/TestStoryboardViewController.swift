//
//  TestStoryboardViewController.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 18/09/19.
//

import UIKit


protocol TestStoryboardViewDisplay: AnyObject {
    func set(interactor: TestStoryboardInteractorProtocol)
    func set(flow: Flow)
}

final class TestStoryboardViewController: UIViewController {
    private var interactor: TestStoryboardInteractorProtocol?
    private var flow: Flow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.getInfo()
    }
}

// MARK: - TestStoryboardViewDisplay
extension TestStoryboardViewController: TestStoryboardViewDisplay {
    func set(interactor: TestStoryboardInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(flow: Flow) {
        self.flow = flow
    }
}
