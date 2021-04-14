//
//  MST.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/12.
//

import Foundation

public final class MST {
  /// Kruskal's MST Algorithm O(ElgE)
  /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple - graph is 1-indexed
  /// - Returns: the tuple of (minimum cost, edges) -> let mst = kruskalMST -> mst.1 = cost
  public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> (Int, [(Int, Int, Int)])  {
    var allEdges = [(u: Int, v: Int, w: Int)]()
    /// store all the edge picked
    var mstEdges = [(u: Int, v: Int, w: Int)]()
    
    for (u, node) in graph.enumerated() {
      for edge in node {
        allEdges.append((u: u, v: edge.v, w: edge.w))
      }
    }
    /// smallest to largest
    allEdges.sort { $0.w < $1.w }
    
    /// create Union find of n elements
    var uf = UF(graph.count)
    for edge in allEdges {
        /// detect cycle
      if uf.connected(edge.u, edge.v) { continue }
        /// connect before append
      uf.union(edge.u, edge.v)
      mstEdges.append(edge)
    }
    
    return (mstEdges.map { $0.w }.reduce(0, +), mstEdges)
  }
  
  /// Prim's MST Algorithm O(ElgV)
  /// Use Priority Queue (Binary Heap) and Adjacency List
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple - graph is 1-indexed
  /// - Returns: the tuple of (minimum cost, edges)
  public func primMST(_ graph: [[(v: Int, w: Int)]]) -> (Int, [CompEdge]) {
    /// num of verteces
    let n = graph.count
    /// keep edges picked
    var mstEdges = [CompEdge]()
    var pq = IndexPriorityQueue<CompEdge>(<)
    var visited = [Bool](repeating: false, count: n)
    /// 1. pick any ndoe to start: starting from 0 vertice
    visited[0] = true
    for edge in graph[0] {
      pq.enqueue(CompEdge(v: edge.v, w: edge.w))
    }
    
    /// while there are elements ->like  if let
    while let edge = pq.dequeue() {
      if !visited[edge.v] {
        visited[edge.v] = true
        mstEdges.append(edge)
        for e in graph[edge.v] {
          pq.enqueue(CompEdge(v: e.v, w: e.w))
        }
      }
    }
    return (mstEdges.map { $0.w }.reduce(0, +), mstEdges)
  }
}

/// to make it comparable to use index priority queue data structure
public struct CompEdge {
  var v: Int // destination
  var w: Int // weight
}

/// compares based on weight
extension CompEdge: Comparable {
  public static func <(lhs: CompEdge, rhs: CompEdge) -> Bool {
    return lhs.w < rhs.w
  }
}
/// conforms to hashable for index priority queue
extension CompEdge: Hashable {}
