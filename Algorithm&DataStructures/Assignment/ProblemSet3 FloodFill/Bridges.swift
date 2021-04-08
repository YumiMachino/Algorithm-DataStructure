//
//  Bridges.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/01.
//

import Foundation

/*
 Bridges
 - Input Specification
    First line: N (size of the map, 1 <= N <= 100)
    Next N lines of data.

 - Output Specification
    The shortest length
 */

func Bridge() {
    struct Map {
        let x: Int
        let y: Int
    }
    
    /// directions for x and y including diagnol directions
    ///      top, bottom, right, left, topRight, bottomRight, topLeft, bottomLeft
    let dx = [0, 0, 1, -1, 1, -1, -1, 1]
    let dy = [1, -1, 0, 0, 1, -1, 1, -1]
    
    /// create Map with the first input
    var mapView = [[Int]]()
    /// input processing: size of map
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let row = readLine()!.map {Int(String($0))!}
        mapView.append(row)
    }
    
    /// store the processed data
    var processedMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    /// variable to increment the distance from the 1
    var count = 0
    var shortestDistance = 0
    
    func bfs(map: Map, id: Int) {
        let q = Queue<Map>()
        q.enqueue(item: map)
        processedMap[map.x][map.y] = id
        while !q.isEmpty() {
            
            let pop = q.dequeue()!
            let x  = pop.x
            let y = pop.y
            /// check all directitons
            for i in 0..<8 {
                let nx = x + dy[i]
                let ny = y + dy[i]
                /// check the  bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    if (mapView[nx][ny] == 1 && processedMap[nx][ny] == 0) {
                        q.enqueue(item: Map(x: nx, y: ny))
                        //  this id has to be incremented
                        processedMap[nx][ny] = id + count
                        count += 1
                        /// compare with shortest distance?
                    }
                }
            }
        }
    }
    
    /// check the start point using for loop (1)
            // Do DFS using the location (from 1, if adjacent is 0, change it to 1, 2, 3... incrementally), compare and update shortestDistance if necessary
    
    /// return the shortestDistance
    
    
}

