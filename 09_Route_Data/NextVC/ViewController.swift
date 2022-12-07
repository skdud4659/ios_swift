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
    
    
    // segue(세그웨이) : 화면의 이동을 담당하는 객체
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 세그웨이를 통해 데이터를 전달하려면 메소드가 필요
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue 명칭이 toThirdVC인 경우
        if segue.identifier == "toThirdVC" {
            // destination에 접근하여
            let thirdVC = segue.destination as! ThirdViewController
            // 데이터 전달
            thirdVC.someString = "할머니 상어 뚜루루뚜루"
        } else if segue.identifier == "toFourthVC" {
            // destination에 접근하여
            let fourthVC = segue.destination as! FourthViewController
            // 데이터 전달
            fourthVC.someString = "할아버지 상어 뚜루루뚜루"
        }
    }
    
    // 4) 버튼 등을 통한 **직접 세그웨이**에서 자동으로 호출하는 메소드 > 조건에 따라 세그웨이를 실행할지 말지 결정하는 메소드
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        <#code#>
    }
}

