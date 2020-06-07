//
//  ViewController.swift
//  Lesson20_homework
//
//  Created by MacBook Air on 23.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit
import Gifu

class TrainingContentViewController: UIViewController {
	
	private var gifImageView = GIFImageView()
	private var headlineTextLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.preferredFont(forTextStyle: .title2)
		label.textColor = .black
		label.numberOfLines = 1
		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .center
		return label
	}()

	private var bodyTextField: UITextView = {
		let tv = UITextView()
		tv.isScrollEnabled = false
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.font = UIFont.preferredFont(forTextStyle: .subheadline)
		tv.textAlignment = .center
		tv.textColor = #colorLiteral(red: 0.07268156829, green: 0.07268156829, blue: 0.07268156829, alpha: 1)
		tv.backgroundColor = .clear
		tv.isEditable = false
		return tv
	}()
	public var pageIndex = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		gifImageView.startAnimatingGIF()
	}
	
	init(for page: TrainingPage) {
		super.init(nibName: nil, bundle: nil)
		view.backgroundColor = .white
		edgesForExtendedLayout = []
		pageIndex = page.pageNumber
		headlineTextLabel.text = page.headlingText
		bodyTextField.text = page.bodyText
		
		gifImageView.prepareForAnimation(withGIFNamed: page.imageName)
		gifImageView.translatesAutoresizingMaskIntoConstraints = false
		gifImageView.contentMode = .scaleAspectFit
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupConstraints() {
		
		Helper.addSubviews(superView: view, subviews: [gifImageView, headlineTextLabel, bodyTextField])
		NSLayoutConstraint.activate([
			gifImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
			gifImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			gifImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			gifImageView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 2/3),
			gifImageView.bottomAnchor.constraint(equalTo: headlineTextLabel.topAnchor, constant: -20)
		])
		
		gifImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
		
		//FIXME: problems with constraints
		NSLayoutConstraint.activate([
			headlineTextLabel.heightAnchor.constraint(equalToConstant: 30),
			headlineTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
			headlineTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headlineTextLabel.bottomAnchor.constraint(equalTo: bodyTextField.topAnchor, constant: 0)
		])
		
		NSLayoutConstraint.activate([
			bodyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			bodyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
			bodyTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
//			bodyTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
			bodyTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
		])
		
		bodyTextField.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
		
	}

	deinit {
		gifImageView.animationImages = nil
	}
}

