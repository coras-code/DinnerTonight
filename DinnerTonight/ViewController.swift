//
//  ViewController.swift
//  DinnerTonight
//
//  Created by My Apps on 17/11/2020.
//

import UIKit

class ViewController: UIViewController {
    var dinner = ""

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var dinnerDetails: UIButton!
    
    override func viewDidLoad() {
        updateUI()
        imageView.image = UIImage(named:"Background11")!
        dinnerDetails.isEnabled = false //this will eventually connected to a Dinner object
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        
        updateUI()
        
        let dinners = ["Spag Bol", "Creamy Mushroom Pasta", "Stuffed Peppers", "Meatballs", "Portobello Mushroom Pesto Pasta", "Teriyaki Salmon", "Vegetable Tagine with Couscous", "Chilli Con Carne", "Chorizo Prawn Linguine"]
        dinner = dinners[Int.random(in: 0...(dinners.count - 1))]
        
        let pictureNumber = Int.random(in: 2...22)
        imageView.image = UIImage(named:"Background\(pictureNumber)")!
    
        dinnerDetails.setTitle(dinner, for: .normal)
        
        //Disappear and reappear when the details appear?
        //titleLabel.text = ""
        //dinnerDetails.isHidden = true
        //tapButton.isHidden = true
        
    }
    
    
    func updateUI() {
        imageView.contentMode = .scaleAspectFill
    
        //Adjust postion
        let positionArray = [7, 4, 8]
        let randomPosition = positionArray[Int.random(in: 0...2)]
        imageView.contentMode = UIView.ContentMode(rawValue: randomPosition)! //probelms with image 7, image 1
        imageView.clipsToBounds = true
                          
        // imageView.contentMode = .left   //7
        // imageView.contentMode = .center //4
        // imageView.contentMode = .right //8
        
        //Disappear and reappear when the details appear?
//        titleLabel.text = "Tonight's Dinner?"
//        tapButton.isHidden = false
//        dinnerDetails.isHidden = false
    }
    
}
