//
//  TomatoFarm.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/01.
//

import Foundation

/*
 Tomato Farm:
 - Input Specification
 First line: M N (M: width, N: height where 2 <= M, N <= 1000)
 Next N lines: 0s and 1s where 0(unripe tomatoes), 1(ripe tomatoes), -1(no tomatoes)
 
 - Output Specification
 The minimum days. (O if already ripe, -1 if there’s no way to get all ripe tomatoes)
 */

func tomatoFarm() {
    /// farm with x and y coordinates
    struct Farm {
        let x: Int
        let y: Int
    }
    
    /// directions for x and y
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    /// create Map with the first input, store the initial input
    var farmMap = [[Int]]()
    /// process the input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let m = firstLine[0]
    let n = firstLine[1]
    
    /// store data processed
    var ripedMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    /// riped -> 1,  unriped -> 0
    func bfs(farm: Farm, riped: Int) {
        let q = Queue<Farm>()
        q.enqueue(item: farm)
        /// new map with
        ripedMap[farm.x][farm.y] = riped
        while !q.isEmpty() {
            let fm = q.dequeue()!
            let x = fm.x
            let y = fm.y
            /// check left, right, front,back
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                /// check the bounds
                if nx >= 0 && nx < m && ny >= 0 && ny < m {
                    if (farmMap[nx][ny] == 0 && ripedMap[nx][ny] == 0) {
                        q.enqueue(item: Farm(x: nx, y: ny))
                        ripedMap[nx][ny] = riped
                    }
                }
            }
        }
    }

/// check the unriped place(starting point) using for loop
    /// Do BFS using the location(change to 1 if its adjacent and 0 、add count
 
    /// return the count
}
