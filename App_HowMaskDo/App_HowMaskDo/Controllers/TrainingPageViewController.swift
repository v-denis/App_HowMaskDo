//
//  PageViewController.swift
//  Lesson20_homework
//
//  Created by MacBook Air on 23.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class TrainingPageViewController: UIPageViewController {
	
	weak var uiUpdateDelegate: UpdateButtonTitleProtocol?
	private var currentPageIndex = 0
	private let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [TrainingPageViewController.self])
	private lazy var arrayPageViewControllers: [TrainingContentViewController] = {
		var pagesVC = [TrainingContentViewController]()
		for index in 0...(TrainingPage.maximumPageNumber) {
			let trainingPage = TrainingPage(pageNumber: index)
			let pageVC = TrainingContentViewController(for: trainingPage)
			pagesVC.append(pageVC)
		}
		return pagesVC
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
		super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
		configuratingPageControl()
		addingDelegates()
		view.backgroundColor = .white
		//setup first presented view controller
		settingUpVCForPageVC()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//MARK: custom methods and selectors for current VC
extension TrainingPageViewController {
	
	private func settingUpVCForPageVC() {
		isDoubleSided = true
		setViewControllers([arrayPageViewControllers[currentPageIndex]], direction: .forward, animated: true, completion: nil)
	}
	
	private func addingDelegates() {
		self.delegate = self
		self.dataSource = self
	}
	
	//configurating page indicators dot colors
	private func configuratingPageControl() {
		pageControl.backgroundColor = .clear
		pageControl.pageIndicatorTintColor = .lightGray
		pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.6626682966, green: 0.2107052523, blue: 0.1707953781, alpha: 1)
	}
	
	private func updateCurrentPageIndex(with newIndex: Int) {
		currentPageIndex = newIndex
		uiUpdateDelegate?.updateButtonTitle(for: currentPageIndex)
	}
}

//MARK: Page View controller data source and delegate methods
extension TrainingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		if let currentVC = pageViewController.viewControllers?.first as? TrainingContentViewController {
			updateCurrentPageIndex(with: currentVC.pageIndex)
		}
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let currentVC = viewController as? TrainingContentViewController else { return nil }
		guard let index = arrayPageViewControllers.firstIndex(of: currentVC) else { return nil }
		if index > 0 {
			return arrayPageViewControllers[index - 1]
		} else {
			return nil
		}
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let currentVC = viewController as? TrainingContentViewController else { return nil }
		guard let index = arrayPageViewControllers.firstIndex(of: currentVC) else { return nil }
		if index < (arrayPageViewControllers.count - 1) {
			return arrayPageViewControllers[index + 1]
		} else {
			return nil
		}
	}
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return arrayPageViewControllers.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return self.currentPageIndex
	}
	
}


//MARK: execution of IncreasePageNumberProtocol method
extension TrainingPageViewController: IncreasePageNumberProtocol {
	func increasePageNumber() {
		if currentPageIndex < (arrayPageViewControllers.count - 1) {
			updateCurrentPageIndex(with: currentPageIndex + 1)
			settingUpVCForPageVC()
		}
	}
	
	
}


/*
// A page indicator will be visible if both methods are implemented, transition style is 'UIPageViewControllerTransitionStyleScroll', and navigation orientation is 'UIPageViewControllerNavigationOrientationHorizontal'.
// Both methods are called in response to a 'setViewControllers:...' call, but the presentation index is updated automatically in the case of gesture-driven navigation.
*/
