//
//  TaskScheduler.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/09.
//

import Foundation

// LeetCode 621 Task Scheduler

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    /// count frequency of each letter
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var freq = [Int](repeating: 0, count: letters.count)
    var highestFreq = 0
    var maxCount = 0
    var totalInterval = 0
    for  i in 0..<tasks.count {
        for j in 0..<letters.count {
            if String(tasks[i]) == letters[j] {
                freq[j] += 1
                if freq[j] > highestFreq {
                    highestFreq = freq[j]
                }
            }
        }
    }
    maxCount = (freq.filter { $0 == highestFreq}).count
    print("freq:", freq)
    print("max:", highestFreq)
    print("num with max:", maxCount)
        
    totalInterval = (highestFreq - 1) * (n + 1) + maxCount
    print(totalInterval)
    return 1
}
