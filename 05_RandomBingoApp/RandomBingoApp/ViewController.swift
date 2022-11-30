//
//  ViewController.swift
//  RandomBingoApp
//
//  Created by Nayeong Kim on 2022/11/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNumber = Int.random(in: 1...10)
    var myNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야함
        guard let numString = sender.currentTitle else {return}
        // 2) numberLabel 숫자에 따라 변경
        numberLabel.text = numString
        // 3) 선택한 숫자를 저장 (선택)
        guard let num = Int(numString) else {return}
        myNumber = num
        
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        comNumber = Int.random(in: 1...10)
    }
    @IBAction func selectTapped(_ sender: UIButton) {
        // 컴퓨터의 숫자와 나의 숫자를 비교하여 UP, DOWN, BINGO 표출
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO🤟🏻"
        }
    }
}

