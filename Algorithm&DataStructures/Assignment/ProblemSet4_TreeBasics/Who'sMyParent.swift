//
//  Who'sMyParent.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/18.
//

import Foundation

/*
 Problem Set 4 (Tree Basics)
 Who’s my parent? - (55 %)

 There’s a tree with the root node as 1.
 Write a program to get the parent node of each node.


 Input Specification
 Firstline: N (the number of nodes, 2 <= N <= 100,000)
 N-1 lines: A B (edge from node A to B, space-separated)

 Output Specification
 Print the parent node of each node starting from node 2 (each line)
 */


//var treeSample = [[nil], [6, 4],[4], [6],[1],[3],[1],[4]]
//
//
//func printParents(_ trees: [[Int]]) -> Void {
//
//    print("aaaa")
//}
//
//
//func temp() {
//    // 1. read first input n
//    print("Enter total number of nodes: ")
//    let n = Int(readLine()!)!
//
//    // -> n: number of total node
//    // create an array with n + 1 index
//    var tree = [[Int]](repeating: [Int](repeating: 0, count: 1), count: n)
//
//    print(tree)
//
//    // prompt n-1 times
//    for _ in 1..<n{
//        print("Enter:")
//        // nodeInfo = ["2", "4"]
//        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
//        // nodeInfo[0]またはnodeInfo[1]がparent
//        // もしどちらかが1の場合 ->自動的に1がparent
//        if Int(nodeInfo[0]) == 1 {
//            let parent = Int(nodeInfo[0])
//            let child = Int(nodeInfo[1])
//        } else if Int(nodeInfo[1]) == 1 {
//            let parent = Int(nodeInfo[1])
//            let child = Int(nodeInfo[0])
//        } else {
//            //もしどちらかのparentが1ならそっちが階層上
//            //depth が浅い方がparent?
//
//        }
//        tree[parent][0].append(child)
//
//
//    }
//
////    let m = Int(readLine()!)!
////    for _ in 0..<n {
////      // nodeInfo = ["A", "B", "C"]
////      let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
////      let parent = Int(Character(nodeInfo[0]).asciiValue! - 65)
////      let left = Int(Character(nodeInfo[1]).asciiValue!)
////      let right = Int(Character(nodeInfo[2]).asciiValue!)
////      // ascii for . is 46 -> -1
////      tree[parent][0] = left == 46 ? -1 : left - 65
////      tree[parent][1] = right == 46 ? -1 : right - 65
////    }
//}


// 1. who's my parent
func whosMyParent() {
  // input spec
  let n = Int(readLine()!)!
  // where / how to store the input? (data structure)
  // -> adjacency list
  var adj = [[Int]](repeating: [], count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  
  // first sample input: [[], [6, 4], [4], [5, 6], [1, 2, 7], [3], [3, 1], [4]]
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  // how to solve the problem? (algorithm)
  // search level by level (breadth first search)
  // root is 1
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        check[v] = true
        parent[v] = u
        q.enqueue(item: v)
      }
    }
  }
  // output spec
  for i in 2...n {
    print(parent[i])
  }
}

func diameter() {
  struct Edge {
    let to: Int
    let distance: Int
  }
  
  func bfs(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Edge]]) {
    let q = Queue<Int>()
    check[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
      let x = q.dequeue()!
      for edge in adjList[x] {
        if !check[edge.to] {
          distances[edge.to] = distances[x] + edge.distance
          q.enqueue(item: edge.to)
          check[edge.to] = true
        }
      }
    }
  }
  
  let n = Int(readLine()!)!
  var adjList = [[Edge]](repeating: [], count: n + 1)
  
  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let from = line[0]
    var j = 1
    while j < line.count - 2 {
      let to = line[j]
      let dist = line[j + 1]
      adjList[from].append(Edge(to: to, distance: dist))
      if line[j + 2] == -1 {
        break
      }
      j += 2
    }
  }
  
  var start = 1
  var check = [Bool](repeating: false, count: n + 1)
  var distances = [Int](repeating: 0, count: n + 1)
  bfs(node: start, check: &check, distances: &distances, adjList: &adjList)
  
  for i in 2...n {
    if distances[i] > distances[start] {
      start = i
    }
  }
  var check2 = [Bool](repeating: false, count: n + 1)
  var distances2 = [Int](repeating: 0, count: n + 1)
  bfs(node: start, check: &check2, distances: &distances2, adjList: &adjList)
  
  print(distances2.max()!) // the max value in distances2
}
