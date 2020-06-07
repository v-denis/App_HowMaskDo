//
//  VideoCell.swift
//  Lesson11_homework
//
//  Created by MacBook Air on 09.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
	
	static let videoCellId = "videoCell"
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
        // Initialization code
    }
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: VideoCell.videoCellId)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		
        // Configure the view for the selected state
    }

}
