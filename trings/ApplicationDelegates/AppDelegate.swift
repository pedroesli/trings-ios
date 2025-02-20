//
//  AppDelegate.swift
//  trings
//
//  Created by Alex Cornforth on 20/09/2022.
//

import UIKit
import GreenstandWalletSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        GreenstandWalletSDK.shared.setup(
            configuration: .init(
                walletAPIConfiguration: .init(
                    apiKey: "",
                    rootURL: URL(string: "")!,
                    rootWalletName: "",
                    rootPassword: ""
                ),
                authenticationServiceConfiguration: .init(
                    authorizationEndpoint: URL(string: "")!,
                    tokenEndpoint: URL(string: "")!,
                    clientId: "",
                    redirectURL: URL(string: "")!,
                    userInfoEndpoint: URL(string: "")!
                )
            )
        )

        // Override point for customization after application launch.
        guard #available(iOS 13.0, *) else {
            let navigationController = BaseNavigationViewController()

            let configuration = CoordinatorConfiguration(
                navigationController: navigationController
            )

            rootCoordinator = RootCoordinator(
                configuration: configuration
            )
            rootCoordinator?.start()

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            return true
        }

        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

