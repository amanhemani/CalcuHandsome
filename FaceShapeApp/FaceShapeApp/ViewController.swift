//
//  ViewController.swift
//  FaceShapeApp
//
//  Created by Aman Hemani on 1/26/19.
//  Copyright © 2019 Aman Hemani. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	var imagePicker = UIImagePickerController()
	
	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var analyzeButton: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func openGallery(_ sender: UIButton) {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
			print("Button capture")
			imagePicker.delegate = self
			imagePicker.sourceType = .photoLibrary
			imagePicker.allowsEditing = false
			self.present(imagePicker, animated: true)
		} else {
			print("Can't open the photo library!")
		}
	}
	
	
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		defer{
			picker.dismiss(animated: true, completion: nil)
		}
		print(info)
		guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
			return
		}
		
		// do something with it
		imageView.contentMode = .scaleAspectFit
		imageView.image = image
		analyzeButton.setTitle("Analyze", for: .normal)
		
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		defer{
			picker.dismiss(animated: true, completion: nil)
		}
		print("cancelled picture grabbing")
	}
	
	@IBAction func goToAnalysis(_ sender: UIButton) {
		self.performSegue(withIdentifier: "segueToAnalysis", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let analysisPage = segue.destination as? SecondViewController
		analysisPage?.image = imageView.image
	}
	
}
