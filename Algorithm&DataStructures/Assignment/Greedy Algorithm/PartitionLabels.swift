//
//  PartitionLabels.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/11.
//

import Foundation

// LeetCode #763 Partition Labels

func partitionLabels(_ S: String) -> [Int] {
    // when the index of new string > last index
    // the end of one partition is the last index of the letters
    var partitionLength = [Int]()
    var lastIndexs = [Int](repeating: 0, count: 26)
    
    let asciiValues = S.compactMap { $0.asciiValue }
    let base = Character("a").asciiValue!
    /// store last index of each letter
    for i in 0..<asciiValues.count {
        lastIndexs[Int(asciiValues[i] - base)] = i
    }
    var i = 0
    while true {
        if i == asciiValues.count {
            break
        }
        // "a"
        var firstLetter = asciiValues[i]
        // last index -> 8
        var last = lastIndexs[Int(asciiValues[i] - base)]
        // if there are other letters before the end of the letter,
        for j in i..<last {
            // move the first index to the index of the letter
            if asciiValues[j] != asciiValues[i] {
                firstLetter = asciiValues[j]
                // last index will be the end of the index of the moved letter
                if lastIndexs[Int(asciiValues[j] - base)] > last {
                    last = lastIndexs[Int(asciiValues[j] - base)]
                }
            }
        }
        partitionLength.append(last + 1)
        i = last + 1
    }
   
    var result = partitionLength
    for k in 0..<partitionLength.count {
        if k != 0 {
            result[k] = partitionLength[k] - partitionLength[k - 1]
        }
    }
   return result
}

