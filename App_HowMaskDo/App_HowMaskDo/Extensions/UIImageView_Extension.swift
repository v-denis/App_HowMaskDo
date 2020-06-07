//
//  UIImageView_Extension.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 09.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

extension UIImageView {
	
	func downloadAndPasteImage(from link: String, completion: @escaping () -> ()) {
		guard let url = URL(string: link) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil else { print(String(describing: error?.localizedDescription))
				return
			}
			guard let response = response as? HTTPURLResponse, let data = data else { return }
			guard response.statusCode >= 200 && response.statusCode < 400 else { return }
			guard let image = UIImage(data: data) else { return }
			DispatchQueue.main.async {
				self.image = image
			}
			completion()
			
		}.resume()
	}
	
	
	static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
		guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
			print("Gif doesn't exis at that path")
			return nil
		}
		let url = URL(fileURLWithPath: path)
		guard let gifData = try? Data(contentsOf: url),
			let source = CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
		var images = [UIImage]()
		let imageCount = CGImageSourceGetCount(source)
		for i in 0..<imageCount {
			if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
				images.append(UIImage(cgImage: image))
			}
		}
		let gifImageView = UIImageView(frame: frame)
		gifImageView.animationImages = images
		return gifImageView
	}
}
