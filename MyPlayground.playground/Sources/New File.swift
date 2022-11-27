//: Playground - noun: a place where people can play

import UIKit

enum conwaySequenceError: ErrorType {
    case outOfBoundError
    case notCalulateHandledError
    case logicalUnHandledError
}


/**
 이 함수는 conwaySwquence 룰 계산하기 위한 private utility function 입니다.
 
 - Parameter sArray: sArray는 squence 를 위한 source 값을 위한 Int Type의 Array
 - Parameter oArray: oArray는 sArray로 부터 얻는 element 를 비교하기 위한 Array로 사용됨
 - Returns: 하나의 row값을 conwaySequence로 계산한 값. String 값으로 반환
 */
func generateNumber(sArray: [Int], oArray: [Int], resultStr: String) throws -> String {
 
    var resultStr = resultStr
    var sArray = sArray
    var oArray = oArray
    
    //Exception 발생, oArray에 값이 없으면, seqence계산을 위한 비교대상이 없다는 것을 의미합니다.
    if oArray.count == 0 && sArray.count == 0 {
        throw conwaySequenceError.notCalulateHandledError }
    
    if oArray.count == 0  {
        throw conwaySequenceError.logicalUnHandledError
    }
    
    //sArray의 count가 0인 경우
    //oArray의 count와, 첫번째 값을 구해서 resultStr에 넣는다.
    //recursive func 을 빠져나가기 위해 조건이 된다.
    if sArray.count == 0 {
        let count = oArray.count
        let type = oArray.first!
        resultStr = resultStr + ("\(count)\(type)")
        return resultStr
    }
    
    
    var checkIndex: Int?
    
    //sArray값을 enumerate 해서 oArray에 있는 값과 비교해서 없으면 oArray에 넣는다.
    //만약 같은 값이 있으면,  oArray의 count와 첫번째 값을 구해 resultStr 으로 더한다.
    //마지막으로 sArray의 source 값을 자르기 위해 index 값을 이용한다.
    for (index, item) in sArray.enumerate() {
        if oArray.indexOf(item) != nil {
            oArray.append(item)
        }
        else {
            let count = oArray.count
            let type = oArray.first!
            resultStr = resultStr + ("\(count)\(type)")
            checkIndex = index
            break
        }
    }
    
    
    //for loop로 부터 구한 index 값을 이용해 sArray를 수정하고, oArray는 초기화 한다.
    //oArray에 sArray의 첫번째 값을 넣은 이유는 비교를 위한 조건을 만족시키기 위해서이다. recursive func을 위해 반드시 필요한 조건임.
    if let index = checkIndex  {
        sArray.removeFirst(index)
        oArray.removeAll()
        
        oArray.append(sArray.first!)
        sArray.removeFirst()
    }
    else {
        sArray.removeAll()
    }
    
    resultStr = try! generateNumber(sArray, oArray: oArray, resultStr: resultStr)
    
    return resultStr

}



/**
 conway sequence를 얻기 위한 func입니다.
 
 - Parameter initNum: initNum 은 1부터 99사이의 값, 초기 값
 - Parameter selectRow: selectRow는 1부터 25지의 값, Row를 가리킨다.
 - Returns: conway sequence 의 결과 값. String 으로 반환되며, 편으를 위해 읽기 쉬운 결과로 formatting 함
 
 - Remark: generateNumber 함수에서 conway sequence 수행할때, sArray와 oArray로 수행하는 비교하고, 계산하는 logic 에 대한 효율적인 개선이 필요함.
 
 - SeeAlso:  `func generateNumber(sArray: [Int], oArray: [Int], resultStr: String) throws -> String`
 
 - Precondition: `initNum` 는 1 부터 100까지, `selectRow` 는 1부터 26 까지 그 이상의 수는 허용하지 않음
 - Requires: `intNum`,`selectRow`는 Int 타입이 되어야 한다.
 
 - Todo: selectRow 값이 커질 수록 실행속도가 느려짐. refactoring 필요.
 
 - Warning: selectRow 가 증가할 수록  Func의 실행속도가 느려짐.
 
 - Version: 0.1
 
 - Author: Hwang Hee
 
 - Note: 다 만들고 타 언어의 구현체와 비교해보니, 간단하게 처리할 문제를 너무 복잡하게 생각하지 않았는지에 대한 고민이 있으나, Conway Sequence 에 대한 사전 지식 없이 생각나는 대로 로직을 구현함.
 */

func generateToconwatSequence(initNum: Int, selectRow: Int) -> String {
    
    //parameter 예외 처리
    switch (initNum, selectRow) {
    case (1..<100, 1...26) :
        print("Parameter Input 값이 조건에 만족한다.")
        //Row가 1일 때는 initNum을 return 합니다.
        if selectRow == 1 { return String(initNum) }
    default:
        return "Parameter Input 값이 조건에 만족하지 않습니다. initNum은 1부터 99사이의 값이고, selectRow 는 1 부터 25사이의 값이어야 합니다."
    }
    
    //result 값, 초기화는 공백없는 빈 문자
    var result: String = ""
    
    //Array 초기화
    var firstStack = Array<Int>()
    var secondStack = Array<Int>()
    
    //initNum을 secondStack 넣는다.
    secondStack.append(initNum)
    
    //1은 loop를 시작하는 기본조건이다.
    for _ in 1...(selectRow - 1) {
        
        //예외처리는 생략한다.
        result = try! generateNumber(firstStack, oArray: secondStack, resultStr: "")
        //result값을 Int Array로 변경
        var myArrayOfInt = result.characters.flatMap{Int(String($0))}
        //SecondSatck 초기화
        secondStack.removeAll()
        //SecondStack 에 myArrayOfInt 의 첫번째 값을 넣는다.
        secondStack.append(myArrayOfInt.first!)
        //FirstStack 초기화
        firstStack.removeAll()
        //myArrayOfInt 의 첫번쨰 인덱스 Item을 지운다.
        myArrayOfInt.removeAtIndex(0)
        //firstStack 에 myArrayOfInt값을 넣는다.
        firstStack = firstStack + myArrayOfInt
    }
    
    //result 값을 formatting 한다.
    result = "첫번째 숫자 R은 \(initNum), L번쨰 라인 \(selectRow), 결과값은 : \(result)"
    return result
}

//사용 예제
let result = generateToconwatSequence(1, selectRow: 5)
print(result)
