//
//  Helper.swift
//  AvenueChat
//
//  Created by Влад Мади on 07.03.2020.
//  Copyright © 2020 Влад Мади. All rights reserved.
//

import UIKit

class Helper {
   static func tamicOff(views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    static func addSubviews(superView: UIView, subviews: [UIView]) {
        for view in subviews {
            superView.addSubview(view)
        }
    }
    
    
    static func isFilled(fields: [String?]) -> Bool {
        for field in fields {
            guard let field = field,
            field != ""
                else {
                    return false
            }
        }
        
        return true
    }
	
	static func getResponse(from link: String) {
		guard let url = URL(string: link) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil else { print(String(describing: error?.localizedDescription))
				return
			}
			guard let response = response as? HTTPURLResponse, let _ = data else { return }
			guard response.statusCode >= 200 && response.statusCode < 400 else { return }
			print(response)
			print(response.allHeaderFields)
		}.resume()
	}
	
	static func downloadImage(from link: String, completion: @escaping (UIImage) -> ()) {
		guard let url = URL(string: link) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil else { print(String(describing: error?.localizedDescription))
				return
			}
			guard let response = response as? HTTPURLResponse, let data = data else { return }
			guard response.statusCode >= 200 && response.statusCode < 400 else { return }
			guard let image = UIImage(data: data) else { return }
			completion(image)
		}.resume()
	}
	
}
