//
//  AppDelegate.swift
//  WBSwift3
//
//  Created by 陈秋松 on 2016/11/1.
//  Copyright © 2016年 陈秋松. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = QSMainViewController()
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        return true
    }

}

extension AppDelegate {
    fileprivate func loadAppInfo() {
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            data?.write(toFile: "main.json".docDir(), atomically: true)
            print("main.json".docDir())
        }
    }
}

