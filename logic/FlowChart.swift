//
//  FlowChart.swift
//  baseballgame
//
//  Created by rin kim on 6/14/24.
//

import Foundation

class FlowChart {
    
    var gameCount = 0
    var tryAnswer = 0
    var gameCounts : [Int] = []
    var tryAnswers : [Int] = [] // repository
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    var printData = PrintData()
    
    // 클래스명 이름 /객체 타입 명사 /함수->동사 객체->명사 식으로 /repsitory /네이밍
    // 기능 과 속성을 구분하고 /
    // View -> Input/output
    // Businesslogic -> compare / seperate class
    // data ->
    // clean Arc
    // view 와 data 의 분리    굿!
    
    
    func printResult (_ count:Int) {
        guard count != 0 else{
            printData.errorM()
            print("게임이력이 없습니다!")
            return menuProcess()
        }
        for i in 0...(count - 1) {
            print("\(gameCounts[i])회차 시도횟수는\(tryAnswers[0])번 입니다. ")
        }
        
        
    }
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-----------------------------------------------------------------------------------------------
    func menuProcess () { // case 따라서 게임 할건지 정하는것
        
        printData.welcomeM()
        printData.whichOneDoYouWant()
        
        print("이곳에 입력해주세요 : ",terminator:"")
        let input = readLine()!
        
        switch input {
            
        case "1":
            logic1()
        case "2":
            logic2()
        case "3":
            logic3()
        default :
            printData.errorM()
            print("잘못된 접근입니다.")
            menuProcess()
            
        }
        //---------------------------------------------------------------------------------------------------ㅡㅡㅡㅡㅡㅡㅡ---------
        
        func logic1() {
            gameCount += 1
            gameCounts.append(gameCount)
            print("\(gameCount)회차 게임시작합니다!")
            
            var computedAnwer = computedAnswer() //컴퓨터 숫자 담기
            
            while true {
                var UserNumber = userAnswerNum() // 3개의 숫자 입력 받아 검증하기 올바른 숫자인지확인후 내가만든답 내보내기
                if compareAwithB(computedAnwer,UserNumber) == "정답!" { // 컴퓨터의 숫자와 내 숫자 비교하기
                    break
                }
                
            }
            //카운트 추가
            
            
            
            tryAnswers.append(tryAnswer)
            tryAnswer = 0 //시도횟수 초기화
            menuProcess() //게임 재시작
        }
        
        
        //------------------------------------------------------------------------------------------------------------------
        func logic2 () {
            printData.recordM()
            print("게임정보를 조회합니다.")
            printResult(gameCounts.count)
            
            menuProcess() //게임 재시작
        }
        
        //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        
        func logic3 () {
            printData.finshM()
            print("게임을 종료합니다.")
        }
    }
    
    //--------------------------------------------------------------------------------------------------------------
    func compareAwithB (_ computedAnswer:[Int],_ userAnswer:[Int])->String {
        
        var strike = 0
        var ball = 0
        var result = ""
        
        for i in 0...2 {
            for j in 0...2{
                if computedAnswer[i] == userAnswer[i] && i == j {
                    strike += 1
                }else if computedAnswer[i] == userAnswer[j] && i != j {
                    ball += 1
                }
            }
            
        }
        result = strike == 0 ? ( ball == 0 ? "값이 없습니다.\n" : "\(ball)볼\n" ) : ( ball == 0 ? "\(strike)스트라이크\n" : "\(strike)스트라이크 \(ball)볼\n")
        tryAnswer += 1
        if strike == 3 { result = "정답!" ; tryAnswer += 1 }
        print(result)
        
        return result
    }
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    func userAnswerNum ()->[Int]{
        var result :[Int]
        while true {
            print("여기에 세개의 숫자를 입력해주세요 : ",terminator:"")
            let userAnswer = readLine()!
            
            let userAnswer2 = userAnswer.map{ Int(String($0))! }
            if Int(userAnswer) == nil || userAnswer.count != 3 || checkOverlap(userAnswer) || userAnswer2[0] == 0 {
                printData.errorM()
                print("잘못된 입력입니다. 숫자는 3개여야하고 숫자외에는 입력불가능하며 중복된숫자를 입력해선 안됩니다.")
                
            }else {
                result = userAnswer2
                return result
            }
        }
    }
    //------------------------------------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    func checkOverlap(_ input: String) -> Bool { // 세트로 중복 피하기
        let set = Set(input)
        return set.count != input.count
    }
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    func computedAnswer ()->[Int] { // 랜덤숫자 3가지
        let temp : [Int] = Array(0...9).shuffled()
        let resultArr = temp[0] == 0 ? Array(temp[1...3]) : Array(temp[0...2])
        print(resultArr)
        return resultArr
    }
}




















