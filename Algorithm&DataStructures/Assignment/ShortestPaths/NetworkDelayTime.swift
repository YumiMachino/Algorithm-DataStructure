//
//  NetworkDelayTime.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/15.
//

import Foundation

/*
 LeetCode #743 Network Delay Time
 https://leetcode.com/problems/network-delay-time/
 
 N nodes of network with directed edges.
 Find the minimum time to get to the furtherst node from given source node.
 
- Dijikstra algorithm
 */

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
     
    struct Queue {
        var items: [(v: Int, w: Int)] = []
        
        mutating func enqueue(element: (v: Int, w: Int)) {
            items.append(element)
        }
        mutating func dequeue() -> (v: Int, w:Int)? {
            guard !items.isEmpty else {return nil }
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement!
        }
    }
    
    /// Create adjacency list based on input
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
    var q = Queue()
    
    //times: [[2,1,1],[2,3,1],[3,4,1]]
    for i in 0..<times.count {
        let edge = times[i]
        let u = edge[0]
        let v = edge[1]
        let w = edge[2]
        adjList[u].append((v: v, w))
    }
    
    ///store distance from node k
    var dist = [Int](repeating: Int.max, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    /// k node from k is always 0
    dist[0] = 0
    dist[k] = 0
    check[k] = true
    check[0] = true
    
    for edge in adjList[k] {
        q.enqueue(element: (edge.v, edge.w))
    }
    
    while let edge = q.dequeue() {

        if check[edge.v] == false && edge.w < dist[edge.v] {
            dist[edge.v] = edge.w
            check[edge.v] = true
            for e in adjList[edge.v] {
                q.enqueue(element: (e.v, e.w + edge.w))
                }
        } else if dist[edge.v] != Int.max && edge.w > dist[edge.v] {
            dist[edge.v] = edge.w
        }
        }
    dist.sorted()
    if dist[dist.count - 1] == Int.max || (check.filter{$0 == false}).count > 0 {
        return -1
    }
    return dist[dist.count - 1]
  }

