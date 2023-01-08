//
//  CreationViewController.swift
//  IntroduceStudent
//
//  Created by CHENGTAO on 1/6/23.
//

import UIKit


class CreationViewController: UIViewController {
    
    
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var homelandTextField: UITextField!
    @IBOutlet weak var favoriteFoodTextField: UITextField!
    
    var introduceStudent: ViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveDidTapped(_ sender: UIButton) {
        
        let isEmptyText = {
            
            if (self.majorTextField.text?.isEmpty == true) || (self.homelandTextField.text?.isEmpty == true) || (self.favoriteFoodTextField.text?.isEmpty == true) {
                return true
            }
            
            return false
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        
        if (isEmptyText()) {
            
            introduceStudent.moreInfoEdited = false
            
            let errAlerController = UIAlertController(title: "", message: "Please type your additonal info on all text fields", preferredStyle: .alert)
            
            // change default setting of title color in the error Alert
            errAlerController.setValue(NSAttributedString(string: "Error", attributes: [.foregroundColor : UIColor.red]), forKey: "attributedTitle")
            
            errAlerController.addAction(okAction)
            
            present(errAlerController, animated: true)
            
            
        } else {
            
            introduceStudent.moreInfoEdited = true
            
            introduceStudent.moreInfoPresent(major: majorTextField.text!, homeland: homelandTextField.text!, favoriteFood: favoriteFoodTextField.text!)
            
            let saveAlerController = UIAlertController(title: "", message: "", preferredStyle: .alert)
            
            // change default setting of title color in the save Alert
            saveAlerController.setValue(NSAttributedString(string: "Save Successful!", attributes: [.foregroundColor : UIColor.green]), forKey: "attributedTitle")
            
            
            saveAlerController.addAction(okAction)
            
            present(saveAlerController, animated: true)
        }
        
    }
    
    
    @IBAction func didBackTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

