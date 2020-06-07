//
//  StepsViewController.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 08.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {
	
	var maskInstruction: MaskInstruction!
	let progressView = UIProgressView(progressViewStyle: .bar)
	let currentStepLabel = UILabel()
	let allStepsCountLabel = UILabel()
	let headlineLabel = UILabel()
	let mainImageView = UIImageView()
	let mainTextView = UITextView()
	let backButton = UIButton(type: .system)
	let forwardButton = UIButton(type: .system)
	var currentStep: Int = 0 {
		willSet {
			updateViewsDataWithNewCurrentStep(newValue)
		}
	}
	var labelsStackView = UIStackView()
	var buttonsStackView = UIStackView()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setupLayout()
		configurateButtonsTargets()
    }
    

}



//MARK: current VC layout
extension StepsViewController {
	
	fileprivate func setupLayout() {
		
		labelsStackView = UIStackView(arrangedSubviews: [currentStepLabel, allStepsCountLabel])
		buttonsStackView = UIStackView(arrangedSubviews: [backButton, forwardButton])
		view.backgroundColor = .white
		forwardButton.layer.borderWidth = 1.0
		forwardButton.layer.borderColor = UIColor.lightGray.cgColor
		backButton.layer.borderWidth = 1.0
		backButton.layer.borderColor = UIColor.lightGray.cgColor
		buttonsStackView.spacing = 0.0
		buttonsStackView.axis = .horizontal
		buttonsStackView.alignment = .fill
		buttonsStackView.distribution = .fillEqually
		labelsStackView.alignment = .firstBaseline
		labelsStackView.axis = .horizontal
		labelsStackView.spacing = 9
		progressView.setProgress(Float(currentStep + 1) / Float(maskInstruction.numberOfSteps), animated: true)
		progressView.progressTintColor = .red
		headlineLabel.textAlignment = .center
		mainImageView.clipsToBounds = true
		mainTextView.isEditable = false
		mainImageView.contentMode = .scaleAspectFill
		
		currentStepLabel.text = "Шаг \(currentStep + 1)"
		allStepsCountLabel.text = "из \(maskInstruction.numberOfSteps)"
		headlineLabel.text = "\(maskInstruction.type.rawValue)"
		mainImageView.image = UIImage(named: maskInstruction.imagesNamesArray[currentStep])
		mainTextView.text = maskInstruction.textsArray[currentStep]
		
		mainTextView.textContainerInset = UIEdgeInsets(top: 12, left: 10, bottom: 5, right: 2)
		mainTextView.showsVerticalScrollIndicator = true
		mainTextView.alwaysBounceVertical = true
		mainTextView.indicatorStyle = .default
		mainTextView.showsHorizontalScrollIndicator = false
		mainTextView.backgroundColor = #colorLiteral(red: 1, green: 0.999801885, blue: 0.8837341138, alpha: 1)
		backButton.setTitle("Назад", for: .normal)
		forwardButton.setTitle("Вперёд", for: .normal)
		
		mainTextView.textColor = UIColor(named: "textColors")
		mainTextView.font = UIFont.preferredFont(forTextStyle: .body)
		allStepsCountLabel.textColor = #colorLiteral(red: 0.4396238925, green: 0.4396238925, blue: 0.4396238925, alpha: 1)
		currentStepLabel.textColor = .red
		currentStepLabel.font = UIFont.preferredFont(forTextStyle: .title1)
		allStepsCountLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
		headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		
		
		Helper.tamicOff(views: [progressView, mainImageView, mainTextView, headlineLabel, labelsStackView, buttonsStackView])
		Helper.addSubviews(superView: view, subviews: [progressView, mainImageView, mainTextView, headlineLabel, labelsStackView, buttonsStackView])
		
		
		NSLayoutConstraint.activate([
			progressView.widthAnchor.constraint(equalTo: view.widthAnchor),
			progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
		
		NSLayoutConstraint.activate([
			labelsStackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
			labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			labelsStackView.heightAnchor.constraint(equalToConstant: 35)
		])
		
		NSLayoutConstraint.activate([
			headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			headlineLabel.heightAnchor.constraint(equalToConstant: 30),
		])
		
		NSLayoutConstraint.activate([
			mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
		])
		
		NSLayoutConstraint.activate([
			mainTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			mainTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mainTextView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 0)
		])
		
		NSLayoutConstraint.activate([
			buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
			buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			buttonsStackView.heightAnchor.constraint(equalToConstant: 52),
			buttonsStackView.topAnchor.constraint(equalTo: mainTextView.bottomAnchor, constant: 0)
		])
		
		if maskInstruction.type == .woven {
			mainImageView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 10).isActive = true
			headlineLabel.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 20).isActive = true
			mainTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 210).isActive = true
		} else {
			mainImageView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 10).isActive = true
			headlineLabel.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 30).isActive = true
			mainImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
			mainTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
		}
		
	}
}


//MARK: custom methods and buttons targets
extension StepsViewController {
	
	fileprivate func configurateButtonsTargets() {
		backButton.addTarget(self, action: #selector(stepsButtonsTapped(_:)), for: .touchUpInside)
		forwardButton.addTarget(self, action: #selector(stepsButtonsTapped(_:)), for: .touchUpInside)
	}
	
	fileprivate func updateViewsDataWithNewCurrentStep(_ newValue: Int) {
		
		currentStepLabel.text = "Шаг \(newValue + 1)"
		mainTextView.flashScrollIndicators()
		self.mainImageView.alpha = 0.25
		mainImageView.image = UIImage(named: maskInstruction.imagesNamesArray[newValue])
		mainTextView.text = ""
		UIView.animate(withDuration: 1.2, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
			self.mainTextView.flashScrollIndicators()
			self.mainTextView.text = self.maskInstruction.textsArray[newValue]
			self.progressView.setProgress(Float(newValue + 1) / Float(self.maskInstruction.numberOfSteps), animated: true)
			self.mainImageView.alpha = 1.0
		})
		
	}
	
}


//MARK: custom selectors
extension StepsViewController {
	
	@objc fileprivate func stepsButtonsTapped(_ sender: UIButton) {
		if sender == backButton {
			if currentStep > 0 {
				currentStep -= 1
			}
		} else if sender == forwardButton {
			if currentStep < (maskInstruction.numberOfSteps - 1) {
				currentStep += 1
			} else if currentStep == maskInstruction.numberOfSteps - 1 {
				let alert = UIAlertController(title: "Поздравляем", message: "Вы закончили с изготовлением данной маски!", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { (action) in
					self.navigationController?.popViewController(animated: true)
				}))
				alert.addAction(UIAlertAction(title: "Остаться", style: .default, handler: nil))
				self.present(alert, animated: true, completion: nil)
			}
		}
	}
}
