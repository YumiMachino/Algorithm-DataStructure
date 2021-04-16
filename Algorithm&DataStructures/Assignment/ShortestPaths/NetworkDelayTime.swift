//
//  NetworkDelayTime.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/15.
//

import Foundation

/// LeetCode #743 Network Delay Time
/// https://leetcode.com/problems/network-delay-time/

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    struct Edge {
        var v: Int
        var w: Int
    }
    
    var dist = [Int](repeating: Int.max, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    dist[k] = 0
    check[k] = true
    
    for _ in 0..<n-1 {
        
    }
    
    
    return 0
  }
