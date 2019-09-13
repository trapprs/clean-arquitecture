//
//  ExempleFeatureInteractor.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import Foundation

protocol ExempleFeatureInteractorProtocol {
    func setPresenter(presenter: ExempleFeaturePresenterProtocol)
    func getInfo()
}

class ExempleFeatureInteractor: ExempleFeatureInteractorProtocol {
    private var service: ExempleFeatureServiceProtocol?
    private var presenter: ExempleFeaturePresenterProtocol?
    
    init(service: ExempleFeatureServiceProtocol) {
        self.service = service
    }
    
    func setPresenter(presenter: ExempleFeaturePresenterProtocol) {
        self.presenter = presenter
    }
    
    func getInfo() {
        service?.getObjects(completion: { [weak self] strings in
            guard let self = self else { return }
            
            self.presenter?.passObject(object: strings)
        })
    }
}
