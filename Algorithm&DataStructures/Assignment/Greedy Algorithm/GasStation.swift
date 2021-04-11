//
//  GasStation.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/10.
//

import Foundation

// LeetCode #134

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var tank = 0
    var count = 0
    
    for i in 0..<gas.count {
        tank = 0
        tank = gas[i] - cost[i]
            while tank >= 0 {
                count += 1
                if count == gas.count {
                    return i
                }
                if (i + count >= gas.count) {
                    let diff = (i + count) - gas.count
                    tank = tank + gas[diff] - cost[diff]
                } else {
                    tank = tank + gas[i + count] - cost[i + count]
                }
            }
        count = 0
        }
    return -1
}
