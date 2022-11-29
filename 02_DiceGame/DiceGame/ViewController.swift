//
//  ViewController.swift
//  DiceGame
//
//  Created by Nayeong Kim on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {

    // image view 변수
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    // 주사위 이미지 배열
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // roll btn 함수
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 첫번째 imageView의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        // 두번째 imageView의 이미지를 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
    }
    
}

