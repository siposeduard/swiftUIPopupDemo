//
//  SceneDelegate.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import UIKit
import SwiftUI
import Combine


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var appState: AppState = AppState()
    var popupSink: AnyCancellable? = nil
    var dismissSink: AnyCancellable? = nil

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = MainView().environmentObject(appState)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.appState.showPopup.send(.somepopup)
        }
        
        popupSink = appState.showPopup.sink(receiveValue: { intent in
            var vc: UIViewController
            switch intent {
            case .somepopup:
                let view = Somepopup().environmentObject(self.appState)
                vc = UIHostingController(rootView: view)
            }
            self.appState.popupStack.push(intent)
            
            vc.modalPresentationStyle = .overCurrentContext
            vc.view.backgroundColor = .clear
            self.getTopController()?.present(vc, animated: true, completion: nil)
        })
        
        dismissSink = appState.dismissPopup.sink(receiveValue: { _ in
            switch self.appState.popupStack.peek() {
            case .somepopup:
                self.getTopController()?.dismiss(animated: false, completion: nil)
            default:
                self.getTopController()?.dismiss(animated: false, completion: nil)
            }
        })
        
        
    }
    
    func getTopController() -> UIViewController? {
        if var topController = self.window?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return nil
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
