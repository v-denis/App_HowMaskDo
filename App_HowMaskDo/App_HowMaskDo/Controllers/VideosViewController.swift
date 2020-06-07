//
//  VideosViewController.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 06.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import WebKit

class VideosViewController: UIViewController {
	
	var videos = [Video]()
	let videosTableView = UITableView()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		fillingVideosArray()
		viewControllerLayout()
		configuratingTitleWithImage()
    }
	
	
	fileprivate func viewControllerLayout() {
		
		self.view.backgroundColor = .white
		videosTableView.dataSource = self
		videosTableView.delegate = self
		videosTableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.videoCellId)
		videosTableView.frame = view.frame
		view.addSubview(videosTableView)
	}
    
	
	fileprivate func configuratingTitleWithImage() {
		
		let label = UILabel()
		label.text = "Видео"
		label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		let label2 = UILabel()
		label2.text = "разборы"
		label2.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		let youtubeImage = UIImage(named: "youtube")
		let imageView = UIImageView(image: youtubeImage)
		imageView.contentMode = .scaleAspectFit
		let stackView = UIStackView(arrangedSubviews: [label, imageView, label2])
		stackView.spacing = 0.0
		self.navigationItem.titleView = stackView
	}
	
	fileprivate func fillingVideosArray() {
		for _ in 1...Video.urlKeysArray.count {
			let newVideo = Video()
			let imageLink = "http://img.youtube.com/vi/\(newVideo.urlKey)/hqdefault.jpg"
			Helper.downloadImage(from: imageLink) { (image) in
				newVideo.thumbnail = image
				self.videos.append(newVideo)
				DispatchQueue.main.async {
					self.videosTableView.reloadData()
				}
			}
		}
	}
	
	
}


extension VideosViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = videosTableView.dequeueReusableCell(withIdentifier: VideoCell.videoCellId, for: indexPath)
		cell.imageView?.image = videos[indexPath.row].thumbnail
		cell.textLabel?.text = videos[indexPath.row].description
		cell.textLabel?.numberOfLines = 3
		cell.textLabel?.adjustsFontSizeToFitWidth = true
		cell.imageView?.contentMode = .scaleAspectFill
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	
		let videoLink = videos[indexPath.row].url
		guard let url = URL(string: videoLink) else { return }
		let urlRequest = URLRequest(url: url)
		let myWebView = WKWebView(frame: view.frame)
		myWebView.backgroundColor = .clear
		myWebView.load(urlRequest)
		let activityIndicator = UIActivityIndicatorView(style: .large)
		let presentVC = UIViewController()
		activityIndicator.startAnimating()
		activityIndicator.color = .lightGray
		
		activityIndicator.center = presentVC.view.center
		presentVC.view.addSubview(activityIndicator)
		presentVC.view.addSubview(myWebView)
		self.navigationController?.pushViewController(presentVC, animated: true)
		self.videosTableView.deselectRow(at: indexPath, animated: true)
	}

}
