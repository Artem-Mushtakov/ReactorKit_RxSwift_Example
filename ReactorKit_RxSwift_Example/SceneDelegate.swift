//
//  SceneDelegate.swift
//  ReactorKit_RxSwift_Example
//
//  Created by Артем on 24.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = TransportViewController()
        window?.makeKeyAndVisible()
    }
}
