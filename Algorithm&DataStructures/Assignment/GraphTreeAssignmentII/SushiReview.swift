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
    var output = 0
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
    
    bfs(vertex: realSushiPlaces[0], adjList: &adjList, visited: &visited, destination: realSushiPlaces)
    print(output)
}

// bredth first search
func bfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool], destination: [Int]) {
    var count = 0
    let queue = Queue<Int>()
    queue.enqueue(item: vertex)
    visited[vertex] = true
    while !queue.isEmpty() {
      let vertex = queue.dequeue()!
      print(vertex)
      
        for v in adjList[vertex] {
            if !visited[v] {
              queue.enqueue(item: v)
              visited[v] = true
                if destination.contains(v) {
                    count += 1
                    print("count: ", count)
                }
               
            }
        }
    }
   
}



