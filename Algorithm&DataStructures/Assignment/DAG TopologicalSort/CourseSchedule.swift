//
//  CourseSchedule.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/07.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    //store undirected graph
    var adj = [[Int]](repeating: [Int](), count: numCourses - 1)
    // create a list of indegree
    var indegree = [Int](repeating: 0, count: numCourses - 1)

    for i in 0..<numCourses-1{
        // create adj list
        let v = prerequisites[i][0]
        adj[i].append(v)
        // increment indegree count
        indegree[v] += 1
    }
        
    // Topological Sort - using BFS(Queue)
    let q = Queue<Int>()
    for  v in 0..<indegree.count {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    while !q.isEmpty() {
        let u = q.dequeue()!
        for v in prerequisites[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    
    for i in 0...indegree.count {
        if indegree[i] != 0 {
            return false
        }
    }
    return true
}

