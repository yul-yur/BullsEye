//
//  ViewController.swift
//  Test
//
//  Created by Юртина Юлия Юрьевна on 13.01.2020.
//  Copyright © 2020 Юртина Юлия Юрьевна. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var currentValue = 0
	var targetValue = 0
	var score = 0
	var round = 0

	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!


	override func viewDidLoad() {
		super.viewDidLoad()
		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
		startNewGame()
	}
	
	@IBAction func showAlert() {

		let difference = abs(currentValue - targetValue)
		var points = 100 - difference

		if difference == 0 {
			points += 100
		} else if difference == 1 {
			points += 50
		}
		score += points

		let title: String
		if difference == 0 {
			title = "Perfect!"
		} else if difference < 5 {
			title = "You almost had it!"
		} else if difference < 10 {
			title = "Pretty Good!"
		} else {
			title = "Not even close..."
		}

		let message = "You scored \(points) points"
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Awesome", style: .default, handler: {
			action in
			self.startNewRound()
		})

		alert.addAction(action)
		present(alert, animated: true, completion: nil)

	}

	@IBAction func sliderMoved (_ slider: UISlider) {

		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
	}


	@IBAction func startNewGame() {
		score = 0
		round = 0
		startNewRound()
	}

	func startNewRound() {
		targetValue = Int.random(in: 1...100)
		currentValue = 50
		slider.value = Float(currentValue)
		round += 1
		updateLabels()
	}

	func updateLabels() {
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}

}
