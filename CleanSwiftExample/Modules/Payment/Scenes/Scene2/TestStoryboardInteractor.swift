//
//  TestStoryboardInteractor.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 18/09/19.
//

import Foundation

protocol TestStoryboardInteractorProtocol {
    func getInfo()
}

final class TestStoryboardInteractor: TestStoryboardInteractorProtocol {
    func getInfo() {
        print("teste")
    }
}
