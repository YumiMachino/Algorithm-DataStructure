//
//  SushiReview2.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/01.
//

import Foundation

/*
 Sushi Review
 */

func sushiReview() {
    /// create graph by input
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    let secondLine = readLine()!.split(separator: " ")
    var realSushiPlacecs = [Int]()
    for i in 0..<m {
        var place = Int(secondLine[i])!
        realSushiPlacecs.append(place)
    }
    print("real sushi place:", realSushiPlacecs)
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<n-1 {
        let edges = readLine()!.split(separator: " ")
        let u = Int(edges[0])!
        let v = Int(edges[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    adjList.remove(at: adjList.count - 1)
    print("adjList: ", adjList)
    print("adjList count: ", adjList.count)
    
    var trimmed = [[Int]]()
    /// keep deleting the edges
    func updateGraph(adjList: inout [[Int]], updatedList: inout [[Int]]) {
        updatedList = adjList
        var removed = [Int]()
        /// store the index with a single element (& not the real place)
        for i in 0...adjList.count - 1 {
            print("i val: ", i)
            var nodes = adjList[i]
            if nodes.count == 1 &&
                !realSushiPlacecs.contains(i) {
                print("delete index: ", i)
                removed.append(i)
            }
        }
        print("removed: ", removed)
        
        /// return from recursive call when there are no elements to remove
        if removed == [] {
            print(updatedList)
            trimmed = updatedList
            return
        }
        
        var count = 0
        var count2 = 0
        // remove by index
        for j in 0..<removed.count {
            print("index: ", removed[j] - count)
            updatedList.remove(at: removed[j] - count)
            count += 1
        }
        /// remove edges from the deleted element
        for i in 0..<updatedList.count {
            var nodes = updatedList[i]
            print("nodes", nodes)
            for j in 0...nodes.count - 1 {
                print("j: ", j)
                if removed.contains(nodes[j]) {
                    updatedList[i].remove(at: j - count2)
                    count2 += 1
                    print("count2: ", count2)
                }
            }
            count2 = 0
        }
        /// updated list
        print("updated list: ", updatedList)
        /// recursively trim the graph
        var newList = [[Int]]()
        updateGraph(adjList: &updatedList, updatedList: &newList)
    }

    var updatedList = [[Int]]()
    updateGraph(adjList: &adjList, updatedList: &updatedList)
    
    print("trimmedList: ", trimmed)
    
    /// search diameter of trimmed
    var distance = 0
    func bfs(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Int]]) {
        let q = Queue<Int>()
        check[node] = true
        q.enqueue(item: node)
        while !q.isEmpty() {
            let x = q.dequeue()!
            for edge in adjList[x] {
                if !check[edge]{
                    // calc distance here
                    distance += 1
                    q.enqueue(item: edge)
                    check[edge] = true
                }
            }
        }
    }
    
    var start = 0
    var check = [Bool](repeating:false, count: trimmed.count)
   
    print("distance: ",distance)
    /// calculate all the routes: (nodes - 1) * 2 - diameter
    
    
}



