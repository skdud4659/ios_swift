//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nayeong Kim on 2022/11/25.
//

import UIKit

class ViewController: UIViewController {

    // @IBOutlet: Interface Builder(뷰-객체)와 연결된 Outlet(배출구)
    // 코드 상의 어떤 설정을 스토리보드로 전달
    
    // layout item(label)과 연결된 변수 설정.
    @IBOutlet weak var mainLabel: UILabel!
    
    // viewDidLoad : 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스토리보드에 다른 문구를 입력하였더라도 앱을 실행시키면 아래 코드가 덮어져 아래 문구로 변경됨.
        // mainLabel.text = "open!!"
    }
    
    // @IBAction: Interface Builter(뷰-객체)와 연결된 Action(동작)
    // 스토리보드상에 이벤트가 일어나는 경우 호출
    
    // layout item(button)과 연결된 함수 설정.
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "HELLO IOS WORLD!!"
        mainLabel.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
}

