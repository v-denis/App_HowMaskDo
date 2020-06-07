//
//  viewWithLabelAndButton.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 07.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class ViewWithLabelAndButton: UIView {
	
	let button: UIButton = {
		let button = UIButton(type: .system)
		button.backgroundColor = .red
		button.layer.cornerRadius = 13
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
		button.layer.borderWidth = 0.5
		button.layer.borderColor = UIColor.lightGray.cgColor
		button.setTitleColor(.white, for: .normal)
		return button
	}()
	let label = UILabel()
	let timeLabel = UILabel()
	let imageView = UIImageView(frame: .zero)
	
	init(labelText: String, labelFont: UIFont, buttonText: String, image: UIImage?, timeText: String) {
		super.init(frame: .zero)
		
		button.setTitle(buttonText, for: .normal)
		
		layer.cornerRadius = 15
		layer.borderWidth = 1.0
		layer.borderColor = UIColor.lightGray.cgColor
		backgroundColor = #colorLiteral(red: 0.9344067259, green: 0.9344067259, blue: 0.9344067259, alpha: 1)
		
		label.textAlignment = .center
		label.adjustsFontSizeToFitWidth = true
		label.text = labelText
		label.font = labelFont
		label.textColor = UIColor(named: "textColors")
		timeLabel.textColor = UIColor(named: "textColors")
		timeLabel.textAlignment = .center
		timeLabel.adjustsFontSizeToFitWidth = true
		timeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
		timeLabel.text = timeText
		imageView.image = image
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		
		
		Helper.tamicOff(views: [button, label, imageView, timeLabel])
		Helper.addSubviews(superView: self, subviews: [button, label, imageView, timeLabel])
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: topAnchor, constant: 12),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
			label.heightAnchor.constraint(equalToConstant: 20)
		])
		
		NSLayoutConstraint.activate([
			timeLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
			timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
			timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
			timeLabel.heightAnchor.constraint(equalToConstant: 20)
		])
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -15)
		])
		
		imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 150), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 150), for: .vertical)
		
		
		NSLayoutConstraint.activate([
			button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
			button.heightAnchor.constraint(equalToConstant: 40),
			button.widthAnchor.constraint(equalTo: widthAnchor, constant: -40)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
