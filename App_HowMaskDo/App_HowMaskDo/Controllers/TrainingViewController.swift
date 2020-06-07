//
//  TrainigViewController.swift
//  App_HowMaskDo
//
//  Created by MacBook Air on 23.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	let pageViewController = TrainingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewController.OptionsKey.interPageSpacing : 10])
	weak var delegate: IncreasePageNumberProtocol?
	let nextButton: UIButton = {
		let button = UIButton(type: .system)
		button.backgroundColor = #colorLiteral(red: 0.6626682966, green: 0.2107052523, blue: 0.1707953781, alpha: 1)
		button.tintColor = .white
		button.setTitle("Далее", for: .normal)
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	let skipButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Пропустить", for: .normal)
		button.setTitleColor(#colorLiteral(red: 0.6626682966, green: 0.2107052523, blue: 0.1707953781, alpha: 1), for: .normal)
		button.backgroundColor = .clear
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		modalPresentationStyle = .fullScreen
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		modalPresentationStyle = .fullScreen
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		modalPresentationStyle = .fullScreen
		setupLayout()
		addingTargets()
		addingDelegates()
    }
    
	private func addingTargets() {
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
		skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
	}
	
	private func addingDelegates() {
		self.delegate = pageViewController
		pageViewController.uiUpdateDelegate = self
	}
	
	fileprivate func setupLayout() {
		view.addGradientBackground(firstColor: #colorLiteral(red: 0.6626682966, green: 0.2107052523, blue: 0.1707953781, alpha: 1), secondColor: .white)
		Helper.addSubviews(superView: view, subviews: [pageViewController.view, nextButton, skipButton])
		pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			pageViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
			pageViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pageViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor),
			pageViewController.view.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -25)
		])
		
		NSLayoutConstraint.activate([
			nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			nextButton.widthAnchor.constraint(equalToConstant: 190),
			nextButton.heightAnchor.constraint(equalToConstant: 45),
			nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -15)
		])
		
		NSLayoutConstraint.activate([
			skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			skipButton.heightAnchor.constraint(equalToConstant: 42),
			skipButton.widthAnchor.constraint(equalToConstant: 150),
			skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
		])
		
		nextButton.layoutIfNeeded()
		nextButton.layer.cornerRadius = nextButton.bounds.height / 2
	}
	
	@objc private func nextButtonTapped() {
		if nextButton.titleLabel?.text == "Закончить" {
			UserDefaultsDataManager.notFirstLaunch = true
			self.dismiss(animated: true, completion: nil)
		} else {
			delegate?.increasePageNumber()
		}
	}
	
	@objc private func skipButtonTapped() {
		UserDefaultsDataManager.notFirstLaunch = true
		self.dismiss(animated: true, completion: nil)
	}
	
}


//MARK: updating button title by protocol execution
extension TrainingViewController: UpdateButtonTitleProtocol {
	
	func updateButtonTitle(for index: Int) {
		if index < TrainingPage.maximumPageNumber {
			self.nextButton.setTitle("Далее", for: .normal)
			skipButton.isHidden = false
		} else {
			self.nextButton.setTitle("Закончить", for: .normal)
			skipButton.isHidden = true
		}
	}
	
}
