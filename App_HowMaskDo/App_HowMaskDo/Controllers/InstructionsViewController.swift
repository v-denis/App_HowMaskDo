//
//  ViewController.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 06.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
	
	var myScrollView = UIScrollView()
	var mainView = UIView()
	let firstView = ViewWithLabelAndButton(labelText: "Из бумажного полотенца",
										   labelFont: UIFont.preferredFont(forTextStyle: .headline),
										   buttonText: "Сделать",
										   image: UIImage(named: "mask1-1"),
										   timeText: "~3 минуты")
	let secondView = ViewWithLabelAndButton(labelText: "Хлопчатобумажная маска",
										   labelFont: UIFont.preferredFont(forTextStyle: .headline),
										   buttonText: "Сделать",
										   image: UIImage(named: "mask4-2"),
										   timeText: "~5 минут")
	let thirdView = ViewWithLabelAndButton(labelText: "Марлевая повязка",
										   labelFont: UIFont.preferredFont(forTextStyle: .headline),
										   buttonText: "Сделать",
										   image: UIImage(named: "mask2-2"),
										   timeText: "~15 минут")
	let fourthView = ViewWithLabelAndButton(labelText: "Из ткани на резинках",
											labelFont: UIFont.preferredFont(forTextStyle: .headline),
											buttonText: "Сделать",
											image: UIImage(named: "mask5-2"),
											timeText: "~25 минут")
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
//		let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
//		topBarSize = (self.navigationController?.navigationBar.frame.height ?? 0) + (window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "❓", style: .plain, target: self, action: #selector(rightBarButtonTapped))
		self.view.backgroundColor = .white
		self.navigationItem.title = "Пошаговые инструкции"
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "К выбору", style: .done, target: self, action: nil)
		setupConstraints()
		firstView.button.addTarget(self, action: #selector(startStepsButtonTapped(_:)), for: .touchUpInside)
		secondView.button.addTarget(self, action: #selector(startStepsButtonTapped(_:)), for: .touchUpInside)
		thirdView.button.addTarget(self, action: #selector(startStepsButtonTapped(_:)), for: .touchUpInside)
		fourthView.button.addTarget(self, action: #selector(startStepsButtonTapped(_:)), for: .touchUpInside)
//		UserDefaultsDataManager.isFirstLaunch = true
//		if UserDefaultsDataManager.isFirstLaunch {
//			self.present(TrainigViewController(), animated: true, completion: nil)
//		}
	}

	@objc fileprivate func rightBarButtonTapped(_ sender: UIBarButtonItem) {
		guard let rootVC = UIApplication.shared.windows.first?.rootViewController else { return }
		rootVC.present(TrainingViewController(), animated: true, completion: nil)
	}
	
	@objc fileprivate func startStepsButtonTapped(_ sender: UIButton) {
		let destVC = StepsViewController()
		switch sender {
			case firstView.button:
				destVC.maskInstruction = MaskInstruction(type: .paper)
			case secondView.button:
				destVC.maskInstruction = MaskInstruction(type: .cotton)
			case thirdView.button:
				destVC.maskInstruction = MaskInstruction(type: .gauze)
			case fourthView.button:
				destVC.maskInstruction = MaskInstruction(type: .woven)
			default: break
		}
		navigationController?.pushViewController(destVC, animated: true)
	}
}


extension InstructionsViewController {
	
	fileprivate func setupConstraints() {
		
		mainView.frame = self.view.frame
		myScrollView = UIScrollView(frame: view.bounds)
		mainView.backgroundColor = #colorLiteral(red: 0.9804290926, green: 0.9804290926, blue: 0.9804290926, alpha: 1)
		myScrollView.backgroundColor = #colorLiteral(red: 0.9804290926, green: 0.9804290926, blue: 0.9804290926, alpha: 1)
		myScrollView.alwaysBounceVertical = true
		myScrollView.bounces = true
		myScrollView.contentInsetAdjustmentBehavior = .never
		
		view.addSubview(myScrollView)
		myScrollView.addSubview(mainView)
		myScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
		
		Helper.addSubviews(superView: mainView, subviews: [firstView, secondView, thirdView, fourthView])
		Helper.tamicOff(views: [firstView, secondView, thirdView, fourthView, myScrollView, mainView])
		
		NSLayoutConstraint.activate([
			myScrollView.topAnchor.constraint(equalTo: view.topAnchor),
			myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])

		NSLayoutConstraint.activate([
			mainView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
			mainView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
			mainView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
			mainView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
			mainView.heightAnchor.constraint(equalToConstant: myScrollView.frame.height),
			mainView.widthAnchor.constraint(equalToConstant: myScrollView.frame.width)
		])
		
		NSLayoutConstraint.activate([
			firstView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: SceneDelegate.shared.topBarHeight + 5),
			firstView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
			firstView.trailingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -10),
			firstView.bottomAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -7),
		])
		
		NSLayoutConstraint.activate([
			secondView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: SceneDelegate.shared.topBarHeight + 5),
			secondView.leadingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 10),
			secondView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
			secondView.bottomAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -7),
		])
		
		
//		print(SceneDelegate.shared.tabBarHeight)
		NSLayoutConstraint.activate([
			thirdView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
			thirdView.trailingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -10),
			thirdView.topAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 7),
			thirdView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -(SceneDelegate.shared.tabBarHeight + 5))
		])
		
		NSLayoutConstraint.activate([
			fourthView.leadingAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 10),
			fourthView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
			fourthView.topAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 7),
			fourthView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -(SceneDelegate.shared.tabBarHeight + 5))
		])
	}
}


/*
- как сделать маски самому в домашних условиях
- приложение с рецептами
- как завязывать узлы пошагово
- угадай мелодию
- как приготовить мыло
- как сделать горшок/вазу
- как сделать изюм из винограда
- как сделать из бумаги что-то (оригами)
*/
