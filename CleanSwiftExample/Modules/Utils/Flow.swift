//
//  Router.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 26/09/19.
//

import Foundation

protocol Flow {
    func start()
    func openNextViewController<T>(with sceneName: T)
    func exitFlow()
}

protocol FlowActionProtocol {
    func start(flow: Flow)
    func openViewController<T>(in flow: Flow, moduleScenes: T)
    func exit()
}

extension FlowActionProtocol {
    func exit() {}
}

final class FlowModules: Flow {
    private var flowModule: FlowActionProtocol?
    
    init(flowModule: FlowActionProtocol) {
        self.flowModule = flowModule
    }
    
    func start() {
        flowModule?.start(flow: self)
    }
    
    func openNextViewController<T>(with sceneName: T) {
        flowModule?.openViewController(in: self, moduleScenes: sceneName)
    }
    
    func exitFlow() {
        flowModule?.exit()
    }
}
