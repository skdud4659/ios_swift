//
//  main.swift
//  RandomBingo
//
//  Created by Nayeong Kim on 2022/11/30.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

// 횟수가 정해져있지 않기 때문에 while 반복문 사용.
// readLine을 계속 실행시키기 위해 조건을 true로 설정.
while true {
    
    // readLine(): cli 입력되는 값을 읽어오는 함수
    var userInput = readLine()
    
    // userInput 옵셔널 벗기기
    if let input = userInput {
        // string 형태의 input을 Int 형태로 변환 > 이 또한 옵셔널값 > 옵셔널 벗기기
        if let number = Int(input) {
            // Int 형태로 만든 number을 myChoice에 할당
            myChoice = number
        }
    }
    
    if computerChoice > myChoice {
        print("UP")
    } else if computerChoice < myChoice {
        print("DOWN")
    } else {
        print("BINGO!")
        // 빙고 시 반복문 종료
        break
    }
}
