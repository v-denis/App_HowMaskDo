//
//  DataManager.swift
//  App_HowMaskDo
//
//  Created by MacBook Air on 24.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import Foundation

class UserDefaultsDataManager {
	
	private static let firstLaunchKey = "firstLaunchKey"
	static var notFirstLaunch: Bool {
		get {
			UserDefaults.standard.bool(forKey: firstLaunchKey)
		}
		set {
			UserDefaults.standard.set(newValue, forKey: firstLaunchKey)
		}
	}
	
}
