//
//  FirstViewController.swift
//  NextVC
//
//  Created by Nayeong Kim on 2022/12/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 이 전 페이지에서 문자열을 전달받기 위한 변수
    var someString: String?
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    let backButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        makeAutoLayout()
    }
    
    private func setUpUI() {
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        view.backgroundColor = .gray
        mainLabel.text = someString
    }
    
    private func makeAutoLayout() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    @objc func backButtonTapped() {
        // 전 화면으로 돌아가기
        dismiss(animated: true)
    }

}
