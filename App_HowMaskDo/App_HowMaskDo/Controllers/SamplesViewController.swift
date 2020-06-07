//
//  SmaplesViewController.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 06.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class SamplesViewController: UICollectionViewController {
	
	let reusableCellId = "sampleCellId"
	let image = UIImage(named: "mask5")
	let layout = UICollectionViewFlowLayout()
	var imagesArray: [String] = (1...20).map { String($0) }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView.backgroundColor = .white
        self.navigationItem.title = "Примеры масок"
		collectionView.register(SampleCell.self, forCellWithReuseIdentifier: reusableCellId)
    }
    
	init() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		super.init(collectionViewLayout: layout)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}


//MARK: collection view datasource and delegate
extension SamplesViewController: UICollectionViewDelegateFlowLayout {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imagesArray.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellId, for: indexPath) as! SampleCell
		let imageName = imagesArray[indexPath.item]
		cell.imageView.image = UIImage(named: imageName)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let imageName = imagesArray[indexPath.item]
		let currentImage = UIImage(named: imageName)
		let aspectRatio = Float(currentImage?.size.width ?? 1) / Float(currentImage?.size.height ?? 1)
		return CGSize(width: view.frame.width, height: view.frame.width / CGFloat(aspectRatio))
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 20
	}
	
	
}
