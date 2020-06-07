//
//  UIView_Extension.swift
//  App_HowMaskDo
//
//  Created by MacBook Air on 24.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

extension UIView {
	
	func addGradientBackground(firstColor: UIColor, secondColor: UIColor) {
		clipsToBounds = true
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
		gradientLayer.frame = self.bounds
		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
		gradientLayer.endPoint = CGPoint(x: 0, y: 0.4)
//		print(gradientLayer.frame)
		self.layer.insertSublayer(gradientLayer, at: 0)
	}
}
