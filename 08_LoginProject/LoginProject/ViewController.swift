//
//  ViewController.swift
//  LoginProject
//
//  Created by Nayeong Kim on 2022/12/05.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        // 가장 마지막에 올린 것이 가장 위에 올라온다.
        view.addSubview(emailInfoLabel)
        return view
    }()
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    private lazy var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("로그인", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 스택뷰
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [
            emailTextFieldView,
            passwordTextFieldView,
            loginButton
        ])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    private let passwordResetButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let textViewHeight: CGFloat = 48
    
    // 오토레이아웃을 담을 변수(애니메이션)
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoLayoutUI()
        
        // delegate pattern 설정
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func autoLayoutUI() {
        view.backgroundColor = .black
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            // 중앙 정렬
            // 애니메이션을 위해 중앙 정렬을 고정해두면 emailInfoLabelCenterYConstraint이 동작하지 않는다.
            //            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            emailInfoLabelCenterYConstraint,
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            //            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    @objc func resetButtonTapped() {
        // alert controller 만들기
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        // 확인 버튼 눌렀을 때
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼이 눌렸다!")
        }
        // 취소 버튼 눌렀을 때
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소 버튼이 눌렸다!")
        }
        alert.addAction(success)
        alert.addAction(cancel)
        // present : 다음 화면으로 넘어가는 메소드
        present(alert, animated: true) {
            print("완료!")
        }
    }
    
    @objc func passwordSecureModeSetting() {
        // bool 타입에서 toggle() 속성 설정 시 true <-> false
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .red
        loginButton.layer.borderWidth = 0
        loginButton.isEnabled = true
    }
    
    @objc func loginButtonTapped() {
        self.view.endEditing(true)
        print("로그인 하기!")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// 기존의 메소드와 섞이지 않게 하기 위해 확장하여 작성 > 코드가 훨씬 깔끔해짐
extension ViewController: UITextFieldDelegate {
    // 입력이 시작되는 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = .gray
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField === passwordTextField {
            passwordTextFieldView.backgroundColor = .gray
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    // 입력이 끝나는 시점
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = .darkGray
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        if textField === passwordTextField {
            passwordTextFieldView.backgroundColor = .darkGray
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
}

