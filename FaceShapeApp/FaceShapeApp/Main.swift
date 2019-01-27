//
//  Main.swift
//  FaceShapeApp
//
//  Created by Aman Hemani on 1/26/19.
//  Copyright © 2019 Aman Hemani. All rights reserved.
//

import Foundation

class AnalysisStuff {
	let CIRCLE = 0
	let OVAL = 1
	let SQUARE = 2
	let RECTANGLE = 3
	let DIAMOND = 4
	let HEART = 5
	
	var faceShape: Int
	
	let HAIRSTYLES = 0
	let URL_STRINGS = 1
	
	var faceShapeNameArray: [String] = ["Circle", "Oval","Square","Rectangle","Diamond","Heart"]
	
	let allFashionOptions: [[[String]]] = [
		[  //Circle
			["Side-Swept Brush Up",
			 "High Skin Fade with Pompadour"
			],
			["https://i.pinimg.com/originals/6f/3b/7a/6f3b7aeef2f2f63ecaed68124a5b2653.jpg",
			 "https://www.menshairstylestoday.com/wp-content/uploads/2017/10/High-Bald-Fade-Shape-Up-Slick-Pompadour.jpg"
			]
		],
		[  //Oval
			["Buzzed Cut",
			 "Brush Back",
			 "Mid-Fade with Pompadour"
			],
			["https://menhairstylesworld.com/wp-content/uploads/2017/09/Buzz-Cut.jpg",
			 "https://www.suavehair.co.uk/wp-content/uploads/2017/12/pushback-hair-suave-peterborough.jpg",
			 "https://alwaysdc.com/wp-content/uploads/2018/08/gel-pompadour-extreme-hold-gel-styles-you-can-easily-create-at-cool-regarding-mid-fade-pompadour-of-mid-fade-pompadour.jpg"
			]
		],
		[  //Sqaure
			["Textured Comb Over",
			 "Crew Cut",
			 "High Fade with Quiff"
			],
			["https://www.supercuts.com/content/dam/supercuts/www/models/2017-models/3x4/heroes/supercuts-alexg-hero-hairstyles-textured-combover-3x4.png/_jcr_content/renditions/cq5dam.web.410.545.large.png",
			 "https://www.styleinterest.com/wp-content/uploads/2018/04/4260418-crew-cut-hairstyles-.jpg",
			 "https://static.fashionbeans.com/wp-content/uploads/2016/10/mensquiffoct3.jpg"
			]
		],
		[  //Rectangle
			["Side Part",
			 "Brush Up",
			 "Side Swept Crew Cut"
			],
			["https://i.dmarge.com/2014/09/Last-Import-014.jpg",
			 "https://media.haircutinspiration.com/photos/20181204005018/Classic-taper-gentlemen-high-volume-sleek-back-%40adamjosephchase.jpg",
			 "https://i.pinimg.com/736x/91/70/74/917074f95cc9c582efb8155d00c1b118--stylish-hairstyles-hairstyles-men.jpg"
			]
		],
		[  //Diamond
			["High Fade with Fringe",
			 "Textured Crop",
			 "Slick Back"
			],
			["https://i.pinimg.com/originals/6d/7b/7f/6d7b7f1d2921159bbb3544ca23238166.jpg",
			 "https://www.menshairstyletrends.com/wp-content/uploads/2016/06/hayden_cassidy-cool-haircuts-for-thick-hair-men-summer-2016-e1466445836996.jpg",
			 "https://static2.fashionbeans.com/wp-content/uploads/2018/07/slickhair-top-2.jpg"
			]
		],
		[  //Heart
			[ "Textured Fringe",
			  "Dimensional Quiff",
			  "Man Bun"
			],
			["https://i.dmarge.com/2015/04/Man-Fringe-1366.jpg",
			 "https://static.fashionbeans.com/wp-content/uploads/2016/10/mensquiffoct1.jpg",
			 "https://media1.s-nbcnews.com/i/newscms/2017_23/1219545/man-buns-chris-hemsworth-today-170606_e5c6aa214bb6e12f896711e553a22515.jpg"
			]
		]
	]
	init(faceShapeNew: Int) {
		self.faceShape = faceShapeNew
	}
	
	func getFaceShapeString(faceShape: Int) -> String{
		return faceShapeNameArray[faceShape]
	}
	
	
	func getHairArray (faceShape: Int) -> [String]{
		return allFashionOptions[faceShape][HAIRSTYLES]
	}
	
	func getUrlStringArray (faceShape: Int) -> [String]{
		return allFashionOptions[faceShape][URL_STRINGS]
	}
}
