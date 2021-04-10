//
//  TaskScheduler.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/09.
//

import Foundation

// LeetCode 621 Task Scheduler

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    // build frequency map
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var freq = [Int](repeating: 0, count: 26)
    var max = 0
    var maxCount = 0
    var totalInterval = 0
    for  i in 0..<tasks.count {
        for j in 0..<letters.count {
            if String(tasks[i]) == letters[j] {
                freq[j] += 1
                if freq[j] > max {
                    max = freq[j]
                }
            }
        }
    }
    var maxCountArr = freq.filter { $0 == max}
    maxCount = maxCountArr.count
    print("freq:", freq)
    print("max:", max)
    print("num with max:", maxCount)
    
    var blankSequence = max - 1
    var blancLength = n - (maxCount - 1)
    var emptySpace = blankSequence * blancLength
    
    // check the lest of the char without max -> put them in the empty spaces
    
    
    return 1
}
