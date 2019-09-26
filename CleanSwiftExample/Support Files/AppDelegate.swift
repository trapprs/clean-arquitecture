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
        let navigationController = UINavigationController()
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            let router = RouterModules(navigation: navigationController, routerModule: PaymentModule.sceneOne)
            router.start()
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
