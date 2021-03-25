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
    let firstLine = readLine()!.split(separator: " ")
    
    // get input for the number of test cases
    let numOfTestCases = Int(firstLine[0])!
    // get num of permutation
    let n = Int(readLine()!)!
    // create adjacency list to store the input permutation: n x n
    var adjMatrix = [[Int]](repeating:[Int](repeating: 0, count: n + 1), count: n + 1)
    
    let edges = readLine()!.split(separator: " ")
    
    for i in 0..<n {
        /// v -> ending nodes
        let v = Int(edges[i])!
        adjMatrix[i + 1][v] = 1
    }
    
    /// inner function for Depth First Search
    func dfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool]) {
      /// check the visiting vertext
      visited[vertex] = true
      print(vertex)
      for v in adjList[vertex] {
        if !visited[v] {
          dfs(vertex: v, adjList: &adjList, visited: &visited)
        }
      }
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    dfs(vertex: 1, adjList: &adjMatrix, visited: &visited)
    
    
    
    
    
}


func adjacencyListDFS() {
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  
  func dfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[vertex] = true
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v] {
        dfs(vertex: v, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  dfs(vertex: 1, adjList: &adjList, visited: &visited)
}

