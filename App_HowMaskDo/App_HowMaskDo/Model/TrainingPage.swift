//
//  PagesHelper.swift
//  App_HowMaskDo
//
//  Created by MacBook Air on 23.04.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

struct TrainingPage {
	
	static let maximumPageNumber = 4
	var pageNumber: Int {
		didSet {
			if self.pageNumber > TrainingPage.maximumPageNumber {
				self.pageNumber = TrainingPage.maximumPageNumber
			} else if self.pageNumber < 0  {
				self.pageNumber = 0
			}
		}
	}
	var imageName: String {
		return gifsNamesArray[pageNumber]
	}
	var headlingText: String {
		return headlinesArray[pageNumber]
	}
	var bodyText: String {
		return bodyTextsArray[pageNumber]
	}
	
	private let gifsNamesArray = ["1", "2", "3", "4", "5"]
	private let headlinesArray = ["Потерялись?", "Идея💡", "Очень просто📝", "Наглядно📺", "Для вдохновения🌅"]
	private let bodyTextsArray = [
		"Если не понимаешь как здесь очутился и зачем тебе это приложение - жми \"Далее\", сейчас всё объясним!",
		"Данное приложение подскажет как сделать медицинскую маску в домашних условиях!\nНа нижней панели три основные вкладки:\n\"По шагам\", \"Видео\" и \"Примеры\"",
		"На первой вкладке вы найдёте несколько полноценных пошаговых инструкций. Выбирай понравившуюся маску и переходи к созданию - на каждом шаге будет фото и описание!",
		"На вкладке \"Видео\" вас ждёт заготовленный набор роликов по созданию медицинской маски в домашних условиях. Приятного просмотра!",
		"На последней вкладке \"Примеры\" вы найдёте множество различных реализаций - на случай если захотите придумать что-то своё.\nУспехов вам и будьте здоровы!"]
	
}
