//
//  ViewController.swift
//  TextFieldDelegatePattern
//
//  Created by Nayeong Kim on 2022/12/02.
///Users/nayeongkim/Documents/ios_swift/07_TextField_delegatePattern/TextFieldDelegatePattern/ViewController.swift

import UIKit

// Delegate 패턴
// textField와 view 간의 커뮤니케이션을 하기 위해서 만드는 패턴
// delegate 패턴을 사용하기 위해서는 프로토콜 UITextFieldDelegate을 채택해서 사용
// 객체와 객체간의 커뮤니케이션을 돕는 패턴

// 1) delegate를 사용하기 위해서는 UITextFieldDelegate 채택
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2) textField는 viewController와는 별개로 존재하기 때문에 대리자인 delegate를 viewController로 설정해줌.
        textField.delegate = self // self = viewController
        
        setup()
    }
    
    func setup() {
        textField.keyboardType = UIKeyboardType.namePhonePad
        textField.placeholder = "placeholder"
        // text 삭제 버튼 노출
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .go
        // textField가 화면에서 첫번째로 실행되어 키보드가 올라옴
        textField.becomeFirstResponder()
    }
    
    // textField 입력을 시작할 때 호출 (시작할지 말지의 여부)
    func textFieldShouldBeginEditing(_ text: UITextField) -> Bool {
        return true
    }

    // textField에 입력이 시작될 때 호출 (입력 시점을 알려줌 > focus에서도 호출) = onFocus
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // textField의 clearButton을 눌렀을 때 호출 (text를 삭제할지 말지의 여부)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // textField의 글자 내용이 한글자 한글자 입력 또는 지워질 때 호출되고 허락 = onChange
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textLength = Int(textField.text?.count ?? 0)
        if textLength > 10 {
            print("10자 이상은 작성할 수 없어요.")
            return false
        } else {
            return true
        }
    }
    
    // textField의 enter키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "입력하세요!"
            return false
        } else {
            return true
        }
    }
    
    // textField의 입력이 끝날 때 호출 (끝날지 말지 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // // textField의 입력이 끝난 시점에 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // becomeFirstResponder의 반대로 실행되어 키보드가 내려감.
        textField.resignFirstResponder()
    }
    
    // 화면의 탭을 감지 >> textField 외부 클릭 시 키보드 내려감.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
}

