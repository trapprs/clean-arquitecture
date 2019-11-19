//
//  AppDelegate.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startRouter()
        
        return true
    }
}

extension AppDelegate {
    private func startRouter() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            FlowModules(flowModule: PaymentModule()).start()
        }
        
        
    }
}
