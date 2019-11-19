//
//  ExempleFeaturePresenter.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import Foundation

protocol ExempleFeaturePresenterProtocol {
    func passObject(object: [String])
}

final class ExempleFeaturePresenter: ExempleFeaturePresenterProtocol {
    private weak var view: ExempleFeatureDisplay?
    
    init(view: ExempleFeatureDisplay) {
        self.view = view
    }
    
    func passObject(object: [String]) {
        view?.displayInfo(object: object)
    }
}
