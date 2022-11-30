//
//  ViewController.swift
//  Timer
//
//  Created by Nayeong Kim on 2022/11/30.
//

import UIKit
// AVFoundation : 시청각 assets 작업, device카메라 제어, 오디오 처리 및 시스템 오디오와의 상호작용 구성
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configreUI()
    }
    
    // 초기 셋팅
    func configreUI() {
        secondsLabel.text = "초를 선택하세요."
        // 슬라이더의 가운데 설정
        // animation 효과를 원할 경우
        slider.setValue(0.5, animated:true)
        // value에 직접적으로 값을 변경할 경우(animation 없음)
        // slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // slider value를 secondsLabel에 설정.
        let seconds = Int(slider.value * 60) // 0.0 - 1.0
        secondsLabel.text = "\(seconds)초"
        number = seconds
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetUI()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 secondsLabel 변경
        timer?.invalidate()
        
        // selector를 사용한 방법
        // Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSthAfter1Sec), userInfo: nil, repeats: true)
        
        // 클로저를 사용한 방법
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복하고 싶은 코드

            // 0이 아닐 때에는 1초씩 줄어들고 아니면 알림
            if number > 0 {
                number -= 1
                // 1초씩 줄어드는 label 적용
                secondsLabel.text = "\(number)초"
                // 1초씩 줄어드는 slide 적용
                slider.setValue(Float(number)/Float(60), animated: true)
            } else {
                resetUI()
                // 알림
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
        }
    }
    
//    @objc func doSthAfter1Sec() {
//        // 0이 아닐 때에는 1초씩 줄어들고 아니면 알림
//        if number > 0 {
//            number -= 1
//            // 1초씩 줄어드는 label 적용
//            secondsLabel.text = "\(number)초"
//            // 1초씩 줄어드는 slide 적용
//            slider.setValue(Float(number)/Float(60), animated: true)
//        } else {
//            resetUI()
//            // 알림
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//        }
//    }
    
    func resetUI() {
        configreUI()
        number = 0
        // timer 설정 초기화
        timer?.invalidate()
    }
}

