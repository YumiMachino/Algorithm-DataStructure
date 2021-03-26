//
//  Graph_cyclicPermutation.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/23.
//

import Foundation

/*
 Cyclic Permutation
 */

// Read input for the following:
// first line: number of test cases (T)
// while there is test case remained
// second:       siez of permutation (N)
// third: permutation of N integers

func cyclicPermutation() {
    
    let test = Int(readLine()!)!
    
    while test >= 0 {
        let n = Int(readLine()!)!
        
        var adjList = [Int](repeating: 0, count: n + 1)
        let edge = readLine()!.split(separator: " ")
        
        for i in 0..<n {
            let u = i + 1
            let v = Int(edge[i])!
            adjList[u] = v
        }
        
        /// inner function for dfs
        func dfs(vertex: Int, adjList: inout [Int], visited: inout [Bool]) {
            /// change 1 to true
            visited[vertex] = true
            /// loop through the list using index
            if !visited[adjList[vertex]] {
                dfs(vertex: adjList[vertex], adjList: &adjList, visited: &visited)
            }
        }
        
        var visited = [Bool](repeating: false, count: n + 1)
        var count = 0
        for v in 1...n {
            if !visited[v] {
                dfs(vertex: v, adjList: &adjList, visited: &visited)
                count += 1
            }
        }
        print(count)
    }
}
