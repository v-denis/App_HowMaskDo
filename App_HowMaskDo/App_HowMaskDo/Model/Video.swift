//
//  Video.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 09.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class Video {
	
	private static var videosNumber = 0
	static var urlKeysArray = ["hirXoP_zvQc","Skhd-UEl7zg","Bp3uHKc51xA","tMZwRT62je0","JfzbgpAQN-4", "VoLn1HHo7-o", "ZeliQyxbL94", "FkxBJaWI2Qo", "ts0qzm4XYXA"]
	private static var descriptionsArray = ["DIY МАСКА своими руками за 5 минут","Как сделать ватно марлевую повязку.","Как сшить многоразовую медицинскую маску своими руками.","ЭТО ДОЛЖЕН УМЕТЬ КАЖДЫЙ!!!!face mask//медицинская маска/многоразовая маска своими руками за 15 минут","Маска за 2 минуты ШИТЬ не надо. Одноразовая маска Своими Руками", "Как сшить маску из ткани", "КАК СДЕЛАТЬ МАСКУ ЗА 2 минуты DIY / МАСКА СВОИМИ РУКАМИ", "МАСКА для лица МНОГОРАЗОВАЯ своими руками / Как сшить маску из ткани", "Одноразовая маска за одну минуту!"]
	let videoNumber: Int
	var url: String {
		return "https://www.youtube.com/embed/\(urlKey)"
	}
	var urlKey: String {
		return Video.urlKeysArray[videoNumber - 1]
	}
	var thumbnail: UIImage = UIImage()
	var description: String {
		return Video.descriptionsArray[videoNumber - 1]
	}
	
	init(image: UIImage = UIImage()) {
		if Video.videosNumber < Video.urlKeysArray.count {
			Video.videosNumber += 1
		} else {
			Video.videosNumber = 1
		}
		videoNumber = Video.videosNumber
		self.thumbnail = image
	}
}


//["hirXoP_zvQc","Skhd-UEl7zg","Bp3uHKc51xA","tMZwRT62je0","JfzbgpAQN-4"]


/*
https://www.youtube.com/watch?v=hirXoP_zvQc
https://www.youtube.com/watch?v=JfzbgpAQN-4
https://www.youtube.com/watch?v=Skhd-UEl7zg
https://www.youtube.com/watch?v=Bp3uHKc51xA
https://www.youtube.com/watch?v=tMZwRT62je0
*/
	
