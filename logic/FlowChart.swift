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
    
    
    
    
    
    
    func startGame () { // case 따라서 게임 할건지 정하는것

        printData.whichOneDoYouWant()
        print("이곳에 입력해주세요 : ",terminator:"")
        let input = readLine()!
        
        switch input {
        case "1": playGame()
        case "2": showRecord()
        case "3": exitGame()
        default : print("잘못된 접근입니다."); startGame()
        }
    }
    //---------------------------------------------------------------------------------------------------ㅡㅡㅡㅡㅡㅡㅡ---------
    
    func playGame() {
        gameCount += 1
        gameCounts.append(gameCount)
        print("\(gameCount)회차 게임시작합니다!\n")
        
        let randomNum = makeRandomNumber() //컴퓨터 숫자 담기
        
        while true {
            tryAnswer += 1
            print("\(tryAnswer)번째 시도 \n")
            let UserNumber = makeUserAnswer() // 3개의 숫자 입력 받아 검증하기 올바른 숫자인지확인후 내가만든답 내보내기
            if compareNum(randomNum,UserNumber) { break }
            }
        tryAnswers.append(tryAnswer)
        tryAnswer = 0 //시도횟수 초기화
        
        startGame() //게임 재시작
    }
    
    
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    func showRecord () {
        printData.recordM()
        print("게임정보를 조회합니다.")
        showRecordData(gameCounts.count)
        
        startGame() //게임 재시작
    }
    
    func showRecordData (_ count:Int) {
        guard count != 0 else{
            printData.errorM()
            print("게임이력이 없습니다!")
            
            return startGame()
        }
        for i in 0...(count - 1) {
            print("\(gameCounts[i])회차 시도횟수는\(tryAnswers[i])번 입니다. ")
        }
        
        
    }
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    func exitGame () {
        print("게임을 종료합니다.")
    }
    
    
    //--------------------------------------------------------------------------------------------------------------
    func compareNum (_ computedAnswer:[Int],_ userAnswer:[Int])->Bool {
        var strike = 0
        var ball = 0
        
        for (index, number) in userAnswer.enumerated() {
            if number == computedAnswer[index] { strike += 1; continue }
            if computedAnswer.contains(number) { ball += 1; continue }
        }
        if strike == 3 { print("정답!\n"); return true }
        else {
            strike == 0 ? ( ball == 0 ? print("값이 없습니다.\n") : print("\(ball)볼\n") ) : ( ball == 0 ? print("\(strike)스트라이크\n") : print("\(strike)스트라이크 \(ball)볼\n"))
            
            print("\n")
            return false
        }
    }
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    
    
    func makeUserAnswer ()->[Int]{
        
        while true {
            
            print("여기에 세개의 숫자를 입력해주세요 : ",terminator:"")
            let userAnswer = readLine() ?? ""
            print("\n")
            let result = userAnswer.compactMap{ Int(String($0)) }
            
            
            if Int(userAnswer) == nil { printData.errorM(); print("숫자만 입력 가능합니다.");tryAnswer += 1; continue }
            if userAnswer.count != 3 { printData.errorM(); print("3개만 입력가능합니다.");tryAnswer += 1; continue }
            if Set(userAnswer).count != userAnswer.count {printData.errorM(); print("중복숫자가 있습니다."); tryAnswer += 1 ; continue }
            if result[0] == 0 { printData.errorM(); print("앞자리에는 0이 올수 없습니다."); tryAnswer += 1; continue }
            
            
            return result
            
            
        }
    }
    //------------------------------------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    func makeRandomNumber () -> [Int] { // 랜덤숫자 3가지
        var randomNumber = Array((0...9).shuffled())
        randomNumber = randomNumber[0] != 0 ?  Array(randomNumber[0...2]) :  Array(randomNumber[1...3])
        print(randomNumber)
        return randomNumber
    }
    
    
    
    
    
    
}
