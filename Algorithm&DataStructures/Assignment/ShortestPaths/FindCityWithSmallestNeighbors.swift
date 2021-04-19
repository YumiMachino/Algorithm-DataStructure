//
//  FindCityWithSmallestNeighbors.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/18.
//

import Foundation

/*
 LeetCode #1334: Find the City With the Smallest Number of Neighbors at a Threshold Distance
 https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/
 
 N cities. Based on the given edges, return the city with smallest number of
 connected edge with under Threshold Distance
 
 - Floyd-Warshall
 */

func findTheCityRev(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
    let indefinite = 10000
    //create adj matrix, store distance between 2 nodes
    var adjList = [[Int]](repeating: [Int](repeating: indefinite, count: n), count: n)
    var tracker = [(index: Int, n: Int, total: Int, threshold: Bool)](repeating: (index: 0, n: 0, total: 0, threshold: false), count: n)
    for e in edges {
        let u = e[0]
        let v = e[1]
        let w = e[2]
        if w == 4 {
            tracker[u].threshold = true
            tracker[v].threshold = true
        }
        adjList[u][v] = w
        adjList[v][u] = w
    }
    for i in 0..<n {
        for j in 0..<n {
            if i == j {
                adjList[i][j] = 0
            }
        }
    }
    //get shortest distance of all pairs
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                adjList[i][j] = min(adjList[i][j], adjList[i][k] + adjList[k][j])
            }
        }
    }
    // delete distance over threshold
    for i in 0..<adjList.count {
        tracker[i].index = i
        tracker[i].n = adjList[i].count
        for j in 0..<adjList[i].count {
            
            tracker[i].total = tracker[i].total + adjList[i][j]
            
            if adjList[i][j] > distanceThreshold {
                tracker[i].n -= 1
                tracker[i].total -= adjList[i][j]
            }
            if adjList[i][j] == 0 {
                tracker[i].n -= 1
            }
        }
    }
    // check the minimum num of n in the tracker
    var min = 0
    for i in 0..<tracker.count {
        if min == 0 {
            min = tracker[i].n
        }
        else if tracker[i].n < min {
            min = tracker[i].n
        }
    }
    print("min n: ", min)
    // if there are multiple city with minimum n, check total
    let t = tracker.filter { $0.n == min}
    print("t: ",t)
    if t.count == 0 {
        return 0
    } else if t.count == 1 {
        print(tracker[0].index)
        return tracker[0].index
    } else {
        // if city with distance threshold?
        for j in 0..<t.count {
            if tracker[t[j].index].threshold == true {
                return t[j].index
            }
        }
        for k in 0..<t.count {
            if adjList[t[k].index].contains(distanceThreshold) {
                return t[k].index
            }
        }
        tracker.sort { $0.total < $1.total }
        return tracker[tracker.count - 1].index
    }
}

