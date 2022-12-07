//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by Nayeong Kim on 2022/12/07.
//

import UIKit

// 구조체 또는 클래스 노상관
// 여러 컨트롤러에서 접근해야해서 확장성을 생각한다면 클래스를 사용
class BMICalculatorManager {
    private var resultBMI: Double = 0.0
    
    func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            resultBMI = 0.0
            return
        }
        let bmi = w / (h * h) * 10000
        resultBMI = round(bmi * 10) / 10
    }
    
    func getBMIResult() -> Double {
        return resultBMI
    }
    
    func settingBMIResult(bmi: Double, label: UILabel, description: UILabel) {
        if bmi <= 18.5 {
            label.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
            description.text = "저체중"
        } else if bmi >= 18.6, bmi <= 22.9 {
            label.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
            description.text = "표준"
        } else if bmi >= 23.0, bmi <= 24.9 {
            label.backgroundColor = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
            description.text = "과체중"
        } else if bmi >= 25.0, bmi <= 29.9 {
            label.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            description.text = "중도 비만"
        } else {
            label.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            description.text = "고도 비만"
        }
    }
}
