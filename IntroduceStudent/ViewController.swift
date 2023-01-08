//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by CHENGTAO on 1/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet var viewControl: UIView!
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    var isBackgroundColorChanged = false
    var moreInfoEdited = false
    var additionalIntroduce: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func stepperDidChange(_ sender: UIStepper) {
        
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        
        // Lets us choose the title we have selected from the segmented control
        // In our example that is whether it is first, second, third or forth
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        // Creating a constant of type string that holds an introduction. The introduction receives the values from the outlet connections.
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
//        print(introduction)
        
        // Creates the alert where we pass in our message, which our introduction.
        let alerController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you! ", style: .default, handler: { (action) in
            self.moreIntroduceAlertAction()
        })
        
        alerController.addAction(action)
        
        
                
        present(alerController, animated: true)
    }
    
    @IBAction func backgroundColDidTapped(_ sender: UIView) {
        
        viewControl.backgroundColor = isBackgroundColorChanged ? UIColor.white : UIColor.orange
        
        isBackgroundColorChanged = !isBackgroundColorChanged
    }
    
    // An UIAlertaction handler to create Y/N options for users to talk more about themselves
    func moreIntroduceAlertAction() {
        
        let moreAlercontroller = UIAlertController(title: "Do you want to talk more about yourself?", message: "", preferredStyle: .alert)
        
        let yesOption = UIAlertAction(title: "Yes!", style: .default, handler: moreIntroduction(_:))
        
        let noOption = UIAlertAction(title: "No", style: .destructive)
        
        moreAlercontroller.addAction(yesOption)
        moreAlercontroller.addAction(noOption)
        
        present(moreAlercontroller, animated: true)
    }
    
    // An alert box for providing more info about the user...
    func moreIntroduction(_ action: UIAlertAction) {
        
        let doneAction = UIAlertAction(title: "Done", style: .default)
                        
        if (moreInfoEdited) {
            
            let additionalIntroAlertCol = UIAlertController(title: "More About Me", message: additionalIntroduce, preferredStyle: .alert)
            
            additionalIntroAlertCol.addAction(doneAction)
            
            present(additionalIntroAlertCol, animated: true)
            
        } else {
            
            let errAlertCol = UIAlertController(title: "Sorry ☹️", message: "Please press the 'More' button to edit your additional information.", preferredStyle: .alert)
            
            errAlertCol.addAction(doneAction)
            
            present(errAlertCol, animated: true)
        }
    }
    
    
    // receiving an additional introduction from MoreInfoView...
    func moreInfoPresent(major: String, homeland: String, favoriteFood: String) -> Void {
        
        let additionalIntroduce = "My major is \(major), and \(homeland) is my homeland. My favorite food is \(favoriteFood)!"
        
        self.additionalIntroduce =  additionalIntroduce
    }
    
    
    // Pass data from creation view controller...
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // set the introduceStudent property to self
        creationController.introduceStudent = self
    }
    
}

