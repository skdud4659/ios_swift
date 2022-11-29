//
//  ViewController.swift
//  RPSGame
//
//  Created by Nayeong Kim on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice: Rps = Rps.rock
    
    // 앱이 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지 적용.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        // 다른 방법 : myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째/두번째 label "준비"로 변경.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 1) 가위/바위/보(enum)를 선택해서 그 정보를 저장해야함.
        
        // currentTitle의 존재가 불명확한 경우 guard로 감싸서 벗김.
//        guard let title = sender.currentTitle else {
//            return
//        }
        // 현재와 같이 currentTitle의 존재가 명확한 경우에는 강제로 벗김.
        let title = sender.currentTitle!
        
        switch title {
        case "가위":
            // 가위 열거형을 만들어서 저장
            myChoice = Rps.scissors
        case "바위":
            // 바위 열거형을 만들어서 저장
            myChoice = Rps.rock
        case "보":
            // 보 열거형을 만들어서 저장
            myChoice = Rps.paper
        default:
            break
        }
    }
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
        // 1) 컴퓨터가 랜덤으로 선택한 것을 이미지뷰/label에 표시.
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 2) 내가 선택한 것을 이미지뷰/label에 표시.
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 3) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 결과를 판단하여 label 표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다,,!"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다!!"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다!!"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다!!"
        } else {
            mainLabel.text = "졌다ㅠㅠ"
        }
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지 적용.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        // 2) 첫번째/두번째 label "준비"로 변경.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        // 3) mainLabel "선택하세요"로 변경.
        mainLabel.text = "선택하세요"
    }
    
    
}

