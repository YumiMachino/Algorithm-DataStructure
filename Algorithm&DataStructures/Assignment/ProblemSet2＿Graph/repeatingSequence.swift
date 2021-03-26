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
    var A = Int(firstLine[0])!
    let p = Int(firstLine[1])!
    
    var value = 0
    var temp: Int = 0
    var arr = [Int]()
    arr.append(A)       // [57]
    var i = 0
    
    while true {
        let s = String(A)   // "57"
        let digits = s.compactMap {$0.wholeNumberValue}
        for i in 0...digits.count - 1 {
            let intVal = Int(digits[i])
            temp = Int(pow(Double(intVal),Double(p)))
            value = value + temp
        }
        arr.append(value)
        A = value
        value = 0
        if !check(value: A, arr: arr) {
            let index = arr.firstIndex(of: arr[i + 1])
            print(index!)
            break
        }
        i += 1
    }
}

/// helper function to check the duplicates
func check(value: Int, arr: [Int]) -> Bool{
    var count = 0
    for i in 0...arr.count - 1 {
        if arr[i] == value {
            count += 1
        }
    }
    if count == 0 || count == 1 {
        return true
    }
    return false
}


