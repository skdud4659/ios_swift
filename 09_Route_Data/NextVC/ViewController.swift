//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        // 데이터 넘기기
        firstVC.someString = "아기 상어 뚜루루뚜루"
        // 가능은 하지만 직접적으로 접근하여 전달하는 방식은 사용하지 않음. 이를 받을 수 있는 변수를 만들어 전달하는 방법을 선호.
//        firstVC.mainLabel.text = "아기 상어 뚜루루뚜루"
        // 화면 꽉 차게 적용하기.
        firstVC.modalPresentationStyle = .fullScreen
        // 화면 이동하기
        present(firstVC, animated: true)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        // withIdentifier: 스토리보드에서도 storyboardID를 맞춰서 설정
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.someString = "아빠 상어 뚜루루뚜루"
        // 스토리보드와 뷰컨트롤러가 그려지는 시점이 다르기 때문에 직접적으로 적용하면 에러가 난다.
        // 스토리보드 위에 인스턴스들이 먼저 생성되고 나중에 뷰컨트롤러가 연결된다.
        // 뷰컨트롤러에 연결되는 그 순간이 viewDidLoad임.
//        secondVC.mainLabel.text = "아빠 상어 뚜루루뚜루"
        present(secondVC, animated: true)
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        

        
        
        
        
    }
    

    
}

