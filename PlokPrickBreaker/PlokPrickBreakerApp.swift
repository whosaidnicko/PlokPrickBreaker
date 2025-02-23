//
//  PlokPrickBreakerApp.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI

@main
struct PlokPrickBreakerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HerhgoAgainView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.iimusynbeqasbqer
    }
    
    static var iimusynbeqasbqer = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: iimusynbeqasbqer))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if iimusynbeqasbqer == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }
}



