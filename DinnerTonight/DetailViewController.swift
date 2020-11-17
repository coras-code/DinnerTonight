//
//  DetailViewController.swift
//  DinnerTonight
//
//  Created by My Apps on 17/11/2020.
//

import UIKit

class DetailViewController: UIViewController {
    
   // var dinnerResult = Dinner!
    var dinnerResult: String!
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var recipeInfoLabel: UILabel!
    
    //tells UIKit that this view controller uses a custome presentation, sets the delgate (self) that will call the (presentationController) method below
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        if dinnerResult != nil {
            updateUI()
        }
        
        //create a new gesture recognizer that listens to taps anywhere in this view controller and calls the close() method in response.
       let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
       gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    // MARK:- Actions
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Helper Methods
    func updateUI() {
    //for now just passing a string but in future it will be properties (e.g name, recipe link) of the 'Dinner' object
    //recipeInfoLabel.text = dinnerResult.name
    recipeInfoLabel.text = dinnerResult
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    //methods (from this delegate protocol) tell UIKit what objects it should use to perform the transition to the Detail View Controller. I.e it will use the Dimming class instead of teh standard presentation controller
    extension DetailViewController: UIViewControllerTransitioningDelegate {
       
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            
            return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
            
        }
    }

//Close Screen when user taps on background
extension DetailViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return (touch.view === self.view)
    }
}
