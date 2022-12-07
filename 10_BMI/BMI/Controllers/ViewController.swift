//
//  ViewController.swift
//  BMI
//
//  Created by Nayeong Kim on 2022/12/07.
//

import UIKit

class ViewController: UIViewController {
    
    // model과 communication
    var bmiManager = BMICalculatorManager()

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDelegate()
        makeUI()
    }

    private func initDelegate() {
        heightTextField.delegate = self
        weightTextField.delegate = self
    }
    private func makeUI() {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        heightTextField.placeholder = "cm단위로 입력해주세요."
        heightTextField.keyboardType = .numbersAndPunctuation
        weightTextField.placeholder = "kg단위로 입력해주세요."
        weightTextField.keyboardType = .numbersAndPunctuation
        
    }
    
    
    // 세그먼트 이동 조건 (조건이 필요할 때에만)
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해야해요!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    // 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let result = segue.destination as! SecondViewController
            // 모델링
            bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
            result.resultString = bmiManager.getBMIResult()
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

