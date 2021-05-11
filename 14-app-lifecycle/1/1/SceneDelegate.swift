//
//  SceneDelegate.swift
//  1
//
//  Created by Petro Golishevskiy on 05.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        print(#function)
        
        /*
         Запустити додаток.
         */
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(#function)
        
        /*
         Використовується у додатках де є мульти сцени. Метод викликається у
         випадку коли сцена в background режимі і система вирішила збільшити
         кількість вільних ресурсів.
         */
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print(#function)
        
        /*
         Запустити додаток або повернутися в додаток після background стану.
         Викликається відразу після sceneWillEnterForeground.
         */
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print(#function)
        
        /*
         Звернути додаток.
         */
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print(#function)
        
        /*
         Запустити додаток або повернутися в додаток після background стану.
         */
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print(#function)
        
        /*
         Звернути додаток.
         */
    }
}

