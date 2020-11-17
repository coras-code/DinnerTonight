//
//  ViewController.swift
//  DinnerTonight
//
//  Created by My Apps on 17/11/2020.
//

import UIKit

class ViewController: UIViewController {
    var dinner = ""

//let ballArray = [#imageLiteral(resourceName: "Background22"),#imageLiteral(resourceName: "Background15"),#imageLiteral(resourceName: "Background20"),#imageLiteral(resourceName: "Background12"),#imageLiteral(resourceName: "Background18"),#imageLiteral(resourceName: "Background21"),#imageLiteral(resourceName: "Background15"),#imageLiteral(resourceName: "Background20"),]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var dinnerDetails: UIButton!
    
    override func viewDidLoad() {
        updateUI()
        imageView.image = UIImage(named:"Background11")!
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
        //tapButton.isHidden = true
        
    }
    
    @IBAction func dinnerDetailsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetail", sender: sender)
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
        titleLabel.text = "Tonight's Dinner?"
        tapButton.isHidden = false
    }
    
     //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue,
                             sender: Any?) {
        if segue.identifier == "ShowDetail" {
        let detailViewController = segue.destination
                                      as! DetailViewController
        //here will be the passing of the dinner object
        let dinnerResult = dinner
        detailViewController.dinnerResult = dinnerResult
        }
    }
    
}
