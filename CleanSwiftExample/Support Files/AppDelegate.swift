//
//  AppDelegate.swift
//  CleanSwiftExample
//
//  Created by Renan Trapp Silva on 12/09/19.
//  Copyright © 2019 Santander Empresas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let router = ExempleFeatureRouter()
        
        window?.rootViewController = router.startRouter()
        window?.makeKeyAndVisible()
        
        return true
    }
}
