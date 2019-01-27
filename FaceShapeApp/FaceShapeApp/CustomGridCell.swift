//
//  CustomGridCell.swift
//  FaceShapeApp
//
//  Created by Aman Hemani on 1/27/19.
//  Copyright © 2019 Aman Hemani. All rights reserved.
//

import UIKit

class CustomGridCell: UICollectionViewCell {
	@IBOutlet weak var hairStyleLabel: UILabel!
	
	@IBOutlet weak var hairImagePreview: UIImageView!
	
	func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
		URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
	}
	
	func downloadImage(from url: URL) {
		print("Download Started")
		getData(from: url) { data, response, error in
			guard let data = data, error == nil else { return }
			print(response?.suggestedFilename ?? url.lastPathComponent)
			print("Download Finished")
			DispatchQueue.main.async() {
				self.hairImagePreview.image = UIImage(data: data)
			}
		}
	}
}
