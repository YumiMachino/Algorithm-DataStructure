//
//  repeatingSequence.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/25.
//

import Foundation

/*
 Repeating Sequence
 */

func repeatingSequence() {
    
    let firstLine = readLine()!.split(separator: " ")
    let A = Int(firstLine[0])!
    let p = Int(firstLine[1])!
    
    var leftInt = A / 10
    var rightInt =  A % ((A / 10) * 10)

    let n = 10
    //create adjancy list
    var adjList = [Int](repeating: 0, count: n)
    adjList[1] = A
    
    
    for i in 2..<n {
        let u = i
        var result1 = pow(Decimal(leftInt), p)
        var result2 = pow(Decimal(rightInt), p)
        let result = NSDecimalNumber(decimal: result1 + result2)
        let v = Int(result)
        adjList[u] = v
        print(adjList)

        leftInt = v / 10
        rightInt = v % ((v / 10) * 10)
    }
    
    
    
}



