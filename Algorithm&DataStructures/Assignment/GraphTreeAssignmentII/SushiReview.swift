//
//  SushiReview.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/26.
//

import Foundation

/*
 Sushi Restaurant Reviews
 */

func temp() {

    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    let secondLine = readLine()!.split(separator: " ")
    var realSushiPlaces = [Int]()
    var distance = 0
    for i in 0..<m {
        realSushiPlaces.append(Int(secondLine[i])!)
    }
    print("real sushi places: ", realSushiPlaces)
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<n - 1 {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
       
      adjList[u].append((v))
      adjList[v].append((u))
    }
    for l in adjList {
      print(l)
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    
//    bfs(vertex: realSushiPlaces[0], adjList: &adjList, visited: &visited, destination: realSushiPlaces)
    tempDfs(vertex: realSushiPlaces[0], adjList: &adjList, visited: &visited, realSushiPlace: &realSushiPlaces)
//    print(distance)
}

// bredth first search
func bfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool], destination: [Int]) {
    var count = 0
    
    let queue = Queue<Int>()
    queue.enqueue(item: vertex)
    visited[vertex] = true
    if destination.contains(vertex) {
        count += 1
        print("count: ", count)
    }
    
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      print(vertex)
      
        for v in adjList[vertex] {
            if !visited[v] {
            bfs(vertex: v, adjList: &adjList, visited: &visited, destination: destination)
//              queue.enqueue(item: v)
              visited[v] = true
            }
        }
    }
   
}

// get the closest distance between 2 locaions (real sushi places)
//func tempBfs(start: Int, desti: Int, adjList: inout [[Int]], visited: inout [Bool]) {
//
//    let queue = Queue<Int>()
//    queue.enqueue(item: start)
//    visited[start] = true
//
//    while !queue.isEmpty() {
//        let vertex = queue.dequeue()!
//
//        for v in adjList[vertex] {
//            if !visited[v] {
//                tempBfs(start: v, desti: <#T##Int#>, adjList: &<#T##[[Int]]#>, visited: &<#T##[Bool]#>)
//            }
//        }
//    }
//}


// get the diameter between 2 locations of real sushi places
// DFS till find the locations
var count = 0
func tempDfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool], realSushiPlace: inout [Int]) {
    if realSushiPlace.contains(vertex) {
        print("containing....!")
    }
    
      visited[vertex] = true
      print(vertex)
      for v in adjList[vertex] {
        if !visited[v] {
          tempDfs(vertex: v, adjList: &adjList, visited: &visited, realSushiPlace: &realSushiPlace)
            count += 1
        }
      }
    print("count: ", count)
}



/// ダイクストラ法
// 1. 各地点までの距離未確定
// 2. 始点の距離は0
// 3. 未確定の地点の中から距離が最も小さい地点を選ぶ -> その距離を[その地点までの最短距離]とする
// 4. 今確定した地点から[直接繋がっている]　かつ[未確定]である地点に対して
// 今確定した場所を経由した場合の距離を計算
// 5. 全ての地点が確定 -> 終了。otherwise back to 3.

//func temp2() {
//    struct Edge {
//        let to: Int
//        let distance: Int
//    }
//
//    let firstLine = readLine()!.split(separator: " ")
//    let n = Int(firstLine[0])!
//    let m = Int(firstLine[1])!
//
//    let secondLine = readLine()!.split(separator: " ")
//    var realSushiPlaces = [Int]()
//
//
//
//}


