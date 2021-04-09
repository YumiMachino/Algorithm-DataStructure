//
//  CourseScheduleII.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/08.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
    //store undirected graph
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    // create a list of indeg
    var indegree = [Int](repeating: 0, count: numCourses)
    var output = [Int]()
    
    for i in 0..<numCourses  {
        // create adj list
        let v = prerequisites[i][0]
        adj[i].append(v)
        // increment indegree count
        indegree[v] += 1
    }
    print("adjList", adj)
    print("indegree", indegree)
    // Topological Sort - using BFS(Queue)
    let q = Queue<Int>()
    for  v in 0..<indegree.count {
        if indegree[v] == 0 {            q.enqueue(item: v)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let u = q.dequeue()!
        output.append(u)
        for v in adj[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.enqueue(item: v)
                print("v", v)
            }
        }
    }
    return output
}
