//
//  SecondViewController.swift
//  BMI
//
//  Created by Nayeong Kim on 2022/12/07.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiManager = BMICalculatorManager()
    
    var resultString: Double = 0.0

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    private func makeUI() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = 8
        resultLabel.text = String(resultString)
        
        bmiManager.settingBMIResult(bmi: resultString, label: resultLabel, description: descriptionLabel)
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
