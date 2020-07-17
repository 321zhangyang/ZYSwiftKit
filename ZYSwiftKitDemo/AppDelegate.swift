//
//  AppDelegate.swift
//  ZYSwiftKitDemo
//
//  Created by zhangyang on 2020/7/17.
//  Copyright © 2020 zhangyang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible();
        self.window?.backgroundColor = UIColor.white;
        let nvc : UINavigationController = UINavigationController.init(rootViewController: TestViewController.init())
        self.window?.rootViewController = nvc;
        // Override point for customization after application launch.
        return true
    }


}

