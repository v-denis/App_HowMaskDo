//
//  SceneDelegate.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 06.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	static let shared = SceneDelegate()
	var window: UIWindow?
	var topBarHeight: CGFloat = 0 
	var tabBarHeight: CGFloat = 0

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let myScene = (scene as? UIWindowScene) else { return }
		
		let instrVC = InstructionsViewController()
		let videoVC = VideosViewController()
		let samplesVC = SamplesViewController()
		let instrNavVC = UINavigationController(rootViewController: instrVC)
		let videoNavVC = UINavigationController(rootViewController: videoVC)
		let samplesNavVC = UINavigationController(rootViewController: samplesVC)
		window?.windowScene = myScene
		
		let tabBarController = UITabBarController()
		tabBarController.tabBar.tintColor = .red
		tabBarController.tabBar.unselectedItemTintColor = UIColor(named: "tabBarIconsColors")
		tabBarController.setViewControllers([instrNavVC, videoNavVC, samplesNavVC], animated: true)
		instrNavVC.tabBarItem = UITabBarItem(title: "По шагам", image: UIImage(systemName: "list.number"), tag: 0)
		videoNavVC.tabBarItem = UITabBarItem(title: "Видео", image: UIImage(systemName: "video"), tag: 1)
		samplesNavVC.tabBarItem = UITabBarItem(title: "Примеры", image: UIImage(systemName: "star"), tag: 2)
		
		let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
		
		window?.rootViewController = launchScreen
		window?.makeKeyAndVisible()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
			self.window?.rootViewController = tabBarController
			
			//calculating height of status bar height + navigation bar height
			let navigationBarHeight = instrNavVC.navigationBar.frame.height
			let statusBarHeight = self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
			SceneDelegate.shared.topBarHeight = navigationBarHeight + statusBarHeight
			//		print("topBarHeight singl: \(SceneDelegate.shared.topBarHeight)")
			
			//calculating tab bar height
			SceneDelegate.shared.tabBarHeight = tabBarController.tabBar.frame.height
			UIApplication.shared.statusBarStyle = .default
			if !(UserDefaultsDataManager.notFirstLaunch) {
				let trainingVC = TrainingViewController()
				tabBarController.present(trainingVC, animated: true, completion: nil)
			}
		}
		
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

