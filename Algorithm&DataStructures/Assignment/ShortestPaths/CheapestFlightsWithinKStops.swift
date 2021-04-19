//
//  CheapestFlightsWithinKStops.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/17.
//

import Foundation

/*
 LeetCode #787 Cheapest Flights Within K Stops
 https://leetcode.com/problems/cheapest-flights-within-k-stops/
 
 N cities, from source to destination, find minimum cost with up to K stops.
 
 -  Bellman Ford algorithm
 */

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    
    /// create adj list
    var edges = [(u: Int, v: Int, w: Int)]()
    var pickedEdges = [(u: Int, v: Int, w: Int)]()
    
    for flight in flights {
        let u = flight[0]
        let v = flight[1]
        let w = flight[2]
        edges.append((u: u, v: v, w: w))
    }
    
    var dist = [(d: Int, k: Int)](repeating: (Int.max, 0), count: n)
    dist[src] = (0,0)
    
    /// N - 1 times
    for _ in 0..<n-1 {
        /// relax all edges
        for edge in edges {
            /// 0 -> 1 = 100, 0 -> 2 = 500
            if dist[edge.v].d > dist[edge.u].d + edge.w {
                if edge.u != src {
                    dist[edge.v].k += 1
                }
                dist[edge.v].d = dist[edge.u].d + edge.w
                pickedEdges.append(edge)
        }
     }
    }
    print(dist)
  
    if src == dst {
        return 0
    }
    else if dist[dst].k <= K {
        print(dist[dst].d)
        return dist[dst].d
    }
    
    /// delete picked edges, and find shortest path again
//    while dist[dst].k > K {
//        for i in 0..<edges.count {
//            for j in 0..<pickedEdges.count {
//                if edges[i] == pickedEdges[j] {
//                    edges.remove(at: i)
//                }
//            }
//        }
//
//        var dist = [(d: Int, k: Int)](repeating: (Int.max, 0), count: n)
//        dist[src] = (0,0)
//
//        /// N - 1 times
//        for _ in 0..<n-1 {
//            /// relax all edges
//            for edge in edges {
//                /// 0 -> 1 = 100, 0 -> 2 = 500
//                if dist[edge.v].d > dist[edge.u].d + edge.w {
//                    if edge.u != src {
//                        dist[edge.v].k += 1
//                    }
//                    dist[edge.v].d = dist[edge.u].d + edge.w
//                    pickedEdges.append(edge)
//                }
//          }
//        }
//    }
//    print(" picked: ",pickedEdges)
//    print("ans: ",dist[dst].d)
    return 0
}

