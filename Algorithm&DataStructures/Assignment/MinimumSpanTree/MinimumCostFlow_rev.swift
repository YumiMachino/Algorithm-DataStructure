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
    /// Krusukal's Algorithm
    /// - 1. Sort .... if same cost, prioritize the one active (inactiveList)
    edges.sort { $0.w < $1.w }
    /// - 2. Pick the smallest edge while avoiding cycles (use UF to detect a cycle)
    let mstResult = kruskalMSTHelper(edges, n, d)
    /// check inactive
    let picked = mstResult.1
    let minimumDays = (picked.filter { $0.active == 0}).count

    print(minimumDays)
}


public struct Edge {
    var u: Int
    var v: Int
    var w: Int
    var active: Int
}

extension Edge: Comparable {
    public static func <(lhs: Edge, rhs: Edge) -> Bool {
        if lhs.w != rhs.w {
            return lhs.w < rhs.w
        }
        return lhs.active > rhs.active
    }
}

extension Edge: Hashable {}


func inputHander() -> (Int,Int, [Edge]){
    // create Edge list bt input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0]
    let m = firstLine[1]
    let d = firstLine[2]
    var edgeList = [Edge]()

    for i in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!

        if i >= n - 1 {
            edgeList.append(Edge(u: u, v: v, w: w, active: 0))
        }
        edgeList.append(Edge(u: u, v: v, w: w, active: 1))
    }
    return (n,d,edgeList)
}

/// Sort: return minimum cost, check enhancer efficiency when picking up the last edge here
func kruskalMSTHelper(_ sortedEdgeList: [Edge], _ n: Int, _ d: Int) -> (Int, [Edge]) {
    var remain = sortedEdgeList
    var pickedEdges = [Edge]()
    var unionFind = UnionFind(sortedEdgeList.count)
    
    for i in 0..<sortedEdgeList.count - 1 {
        var edge = sortedEdgeList[i]
        if unionFind.connected(edge.u, edge.v) { continue }
        unionFind.union(edge.u, edge.v)
        //last node: highest cost
        if pickedEdges.count == n - 1 {
            // 残りのやつ全部にuse enhancer, sort-> select minimum as last node
            for j in 0..<remain.count {
                if remain[j].w > d {
                    remain[j].w = remain[j].w - d
                }
            }
        }
        pickedEdges.append(edge)
        remain.removeFirst()
    }
    
    remain.sort { $0 < $1 }
    pickedEdges.append(remain[0])
    
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
    for i in 0..<n  {
      self.parent[i] = i
    }
  }

  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    var root = p
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





func testHandler() {
    let fileManager = FileManager()
    let testFolder = "/Users/yumi/Documents/CICCC/Algorithm&DataStructures/Algorithm&DataStructures/Assignment/MinimumSpanTree/mcfTest"
    
    var i = 0
    if let filePath = try? fileManager.contentsOfDirectory(atPath: testFolder).sorted() {
        while i < filePath.count {
            let url = URL(fileURLWithPath: testFolder + "/" + filePath[i])
            let input = try? String(contentsOf: url, encoding: .utf8)
            let testInput = input!.split(separator: "\n").map { String($0) }
            print(testInput)
            var firstLine = testInput[0]
            var intFirstLine = [Int]()
            
            for j in 0..<firstLine.count {
                if firstLine[j..<j + 1] == " " {
                    continue
                } else {
                    intFirstLine.append(Int(firstLine[j..<j + 1])!)
                }
            }
            print("intFirstLine: ", intFirstLine)
            let n = intFirstLine[0]
            let m = intFirstLine[1]
            let d = intFirstLine[2]
            var edgeList = [Edge]()
            
            for i in 1..<testInput.count - 1 {
                let edge = testInput[i]
                testInput[i].filter { Int($0)? Int($0) : ""}
                
                let u = Int(edge[0])!
                let v = Int(edge[1])!
                let w = Int(edge[2])!

                if i >= n - 1 {
                    edgeList.append(Edge(u: u, v: v, w: w, active: 0))
                }
                edgeList.append(Edge(u: u, v: v, w: w, active: 1))
            }
            return (n,d,edgeList)
            
        }
    }
}


extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}


