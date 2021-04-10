//
//  TwoCityScheduling.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/08.
//

import Foundation

//  LeetCode 1029 Two City Scheduling

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var totalCost = 0
    var weightCosts = costs
    
    for i in 0..<costs.count {
        weightCosts[i].append(costs[i][0] - costs[i][1])
    }
    let sorted = weightCosts.sorted { $0[2] < $1[2]}
    for i in 0..<sorted.count {
        if i < (sorted.count / 2) {
            totalCost += sorted[i][0]
        } else {
            totalCost += sorted[i][1]
        }
    }
    return totalCost
}
