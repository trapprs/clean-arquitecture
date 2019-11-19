//
//  ExampleFeatureService.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import Foundation

protocol ExempleFeatureServiceProtocol {
    func getObjects(completion: @escaping([String]) -> Void)
}

class ExempleFeatureService: ExempleFeatureServiceProtocol {
    func getObjects(completion: @escaping ([String]) -> Void) {
        completion(["teste", "test2"])
    }
}

class ExempleFeatureService2: ExempleFeatureServiceProtocol {
    func getObjects(completion: @escaping ([String]) -> Void) {
        completion(["teste222", "test2"])
    }
}
