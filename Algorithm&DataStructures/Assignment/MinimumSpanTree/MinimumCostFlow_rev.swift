//
//  MinimumCostFlow_rev.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/04/15.
//

import Foundation

func solutionRev()  {
    
    let result = inputHander()
    let n = result.0
    let d = result.1
    var edges = result.2
    var inactive = result.3
    /// Krusukal's Algorithm
    /// - 1. Sort .... if same cost, prioritize the one active (inactiveList)
    edges.sort { $0.w < $1.w }
    
    for i in 0..<edges.count {
        if i < edges.count-1 && inactive.contains(edges[i]) && !inactive.contains(edges[i + 1]) {
            if edges[i].w == edges[i + 1].w {
                edges.swapAt(i, i + 1)
            }
        }
    }

    /// - 2. Pick the smallest edge while avoiding cycles (use UF to detect a cycle)
    var mstResult = kruskalMSTHelper(edges, n, d)
//    var minimumCost = mstResult.0
    
    /// check inactive
    var picked = mstResult.1
    var minimumDays = 0
 
    for edge in picked {
        for pipe in inactive {
            if (edge.v, edge.w) == (pipe.v, pipe.w) {
                minimumDays += 1
            }
        }
    }
    print(minimumDays)
    
}


public struct Edge {
    var u: Int
    var v: Int
    var w: Int
}

extension Edge: Comparable {
    public static func <(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.w < rhs.w
    }
}

extension Edge: Hashable {}



func inputHander() -> (Int,Int, [Edge],[Edge]){
    // create Edge list bt input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0]
    let m = firstLine[1]
    let d = firstLine[2]
    var edgeList = [Edge]()
    var inactiveList = [Edge]()
    
    for i in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!
        // fix
        if i >= n - 1 {
            inactiveList.append(Edge(u: u, v: v, w: w))
        }
        edgeList.append(Edge(u: u, v: v, w: w))
    }
    return (n,d,edgeList, inactiveList)
}

/// Sort: return minimum cost, check enhancer efficiency when picking up the last edge here
func kruskalMSTHelper(_ sortedEdgeList: [Edge], _ n: Int, _ d: Int) -> (Int, [Edge]) {
    var remain = sortedEdgeList
    var sortedRemain = [Edge]()
    var pickedEdges = [Edge]()
    var unionFind = UnionFind(sortedEdgeList.count)
    
    for i in 0..<sortedEdgeList.count - 1 {
        var edge = sortedEdgeList[i]
        if unionFind.connected(edge.u, edge.v) { continue }
        unionFind.union(edge.u, edge.v)
        //last node: highest cost
        if pickedEdges.count == n - 1 {
            // 残りのやつ全部にuse enhancer, sort-> select minimum as last node
            for rem in remain {
                if edge.w > d {
                    edge.w = edge.w - d
                }
            }
        
        }
        pickedEdges.append(edge)
        remain.remove(at: i)
    }
    
    remain.sort { $0.w < $1.w }
    pickedEdges.append(remain[0])
    
//    for edge in sortedEdgeList {
//        if unionFind.connected(edge.u, edge.v) { continue }
//        unionFind.union(edge.u, edge.v)
//        //last node: highest cost
//        if pickedEdges.count == n - 1 {
//            // 残りのやつ全部にuse enhancer, sort-> select minimum as last node
//
//
//        }
//        pickedEdges.append(edge)
//
//    }
    return (pickedEdges.map{ $0.w }.reduce(0, +), pickedEdges)
}


public struct UnionFind {
  /// parent[i] = parent of i
  private var parent: [Int]
  /// size[i] = number of nodes in tree rooted at i
  private var size: [Int]
  /// number of components
  private(set) var count: Int

  /// Initializes an empty union-find data structure with **n** elements
  /// **0** through **n-1**.
  /// Initially, each elements is in its own set.
  /// - Parameter n: the number of elements
  public init(_ n: Int) {
    self.count = n
    self.size = [Int](repeating: 1, count: n + 1 )
    self.parent = [Int](repeating: 0, count: n + 1 )
    for i in 0..<n {
      self.parent[i] = i
    }
    print("uf: ", self)
  }

  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    var root = p
    print(root, parent)
    while root != parent[root] { // find the root
      root = parent[root]
    }
    var p = p
    while p != root {
      let newp = parent[p]
      parent[p] = root  // path compression
      p = newp
    }
    return root
  }

  /// Returns `true` if the two elements are in the same set.
  /// - Parameters:
  ///   - p: one elememt
  ///   - q: the other element
  /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
  public mutating func connected(_ p: Int, _ q: Int) -> Bool {
    return find(p) == find(q)
  }

  /// Merges the set containing element `p` with the set containing
  /// element `q`
  /// - Parameters:
  ///   - p: one element
  ///   - q: the other element
  public mutating func union(_ p: Int, _ q: Int) {
    let rootP = find(p)
    let rootQ = find(q)
    guard rootP != rootQ else { return } // already connected

    // make smaller root point to larger one
    if size[rootP] < size[rootQ] {
      parent[rootP] = rootQ
      size[rootQ] += size[rootP]
    } else {
      parent[rootQ] = rootP
      size[rootP] += size[rootQ]
    }
    count -= 1
  }

}
