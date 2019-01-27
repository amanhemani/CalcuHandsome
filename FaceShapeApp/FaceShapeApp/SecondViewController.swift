//
//  SecondViewController.swift
//  FaceShapeApp
//
//  Created by Aman Hemani on 1/26/19.
//  Copyright © 2019 Aman Hemani. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource {
	var hairStylesArray: [String] = []
	var faceShape: Int = 0
	
	
	
	var image: UIImage?
	@IBOutlet weak var titleLabel: UILabel!
	var analysisStuff: AnalysisStuff?
	
	@IBOutlet weak var gridView: UICollectionView!
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return hairStylesArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//		var textLabel = UILabel()
		//		textLabel.text = "Item"
		//		cell.contentView.addSubview(textLabel)
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hairStyle", for: indexPath) as! CustomGridCell
		cell.hairStyleLabel.text = hairStylesArray[indexPath.row]
		let url = URL(string: analysisStuff!.getUrlStringArray(faceShape: faceShape)[indexPath.row])
		cell.downloadImage(from: url!)
		cell.hairImagePreview.contentMode = .scaleAspectFit
		return cell
	}
	
//	func adjustImagePreviewSize(imageToPreview: UIImage, imageView: UIImageView) -> Void{
//		let ratio: Float = Float(imageToPreview.size.height / imageToPreview.size.width)
//		imageView.image = imageToPreview
//		let widthForPreview = Float((imageView.image?.size.width)!)
//		let heightForPreview = widthForPreview * ratio
	
	func getNewCellHeight(imageToPreview: UIImage, cell: CustomGridCell) -> Float{
		cell.hairImagePreview.image = imageToPreview
		let ratio: Float = Float(imageToPreview.size.height / imageToPreview.size.width)
		let widthToUse: Float = Float(cell.hairImagePreview.image?.size.width ?? 0)
		let heightToUse: Float = widthToUse * ratio
		return heightToUse
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super .viewWillAppear(true)
		//analysis here on image var
		analysisStuff = AnalysisStuff(faceShapeNew: faceShape)
		faceShape = 4
		hairStylesArray = getHairStyles(faceShape: faceShape)
		displayResults(faceShape: faceShape)
		
	}
	
	func getHairstylePreviewImage() -> UIImage {
		return image!
	}

	
	func displayResults (faceShape: Int){
		makeTitle(faceShape: faceShape)
		
	}
	
	func getHairStyles(faceShape: Int) -> [String]{
		let hairStyles: [String] =  analysisStuff?.getHairArray(faceShape: faceShape) ?? []
		print(hairStyles)
		return hairStyles
		
	}
	
	func makeTitle (faceShape: Int){
		titleLabel.text = "\(getFaceShapeString(faceShape: faceShape)) Face Shape"
	}
	
	func getFaceShapeString(faceShape: Int) -> String{
		return analysisStuff?.getFaceShapeString(faceShape: faceShape) ?? "Some"
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
