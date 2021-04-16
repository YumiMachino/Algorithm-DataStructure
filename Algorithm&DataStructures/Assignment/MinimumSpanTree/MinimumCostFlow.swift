import Foundation

// copy-paste all your classes/structs used in the program.

//struct Edge {}
//class Graph {}
// ...

public struct PriorityQueue<Key: Comparable & Hashable> {
    private(set) var elements = [Key]()
    private var order: (Key, Key) -> Bool
    private var indices = [Key: Int]()

    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var count: Int {
        return elements.count
    }

    public var peek: Key? {
        return elements.first
    }

    public init(_ order: @escaping (Key, Key) -> Bool) {
        self.order = order
    }
    public func contains(key: Key) -> Bool {
        return indices[key] != nil
    }

    public mutating func enqueue(_ key: Key) {
        guard  !contains(key: key) else { return }
        elements.append(key)
        indices[key] = elements.count - 1
        siftUp(from: elements.count - 1)
    }

    @discardableResult
    public mutating func dequeue() -> Key? {
        if isEmpty { return nil }
        let peek = self.peek!
        swapAt(0, count - 1)
        elements.remove(at: count - 1)
        indices[peek] = nil
        siftDown(from: 0)
        return peek
    }

    public mutating func update(oldKey: Key, to newKey: Key) {
        guard let index = indices[oldKey] else { return }
        elements[index] = newKey
        siftDown(from: index)
        siftUp(from: index)
    }

    private mutating func siftUp(from i: Int) {
        var i = i
        while i > 0 && order(elements[parent(of: i)], elements[i]) {
            swapAt(parent(of: i), i)
            i = parent(of: i)
        }
    }

    private mutating func siftDown(from i: Int) {
      var i = i
      while left(of: i) < count {
        var j = left(of: i)
        if j < count - 1 && order(elements[j], elements[j + 1]) {
          j += 1
        }
        if !order(elements[i], elements[j]) { break }
        swapAt(i, j)
        i = j
      }
    }

    private mutating func swapAt(_ i: Int, _ j: Int) {
      elements.swapAt(i, j)
      indices[elements[i]] = i
      indices[elements[j]] = j
    }

    @inline(__always) private func parent(of index: Int) -> Int {
      return (index - 1) / 2
    }

    @inline(__always) private func left(of index: Int) -> Int {
      return 2 * index + 1
    }

    @inline(__always) private func right(of index: Int) -> Int {
      return 2 * index + 2
    }
}


// make graph comparable to use priority queue
public struct ComparableEdge {
    var v: Int  // destination
    var w: Int  // weight
}

/// return comparison based on weight of edges
extension ComparableEdge: Comparable {
    public static func <(lhs: ComparableEdge, rhs: ComparableEdge) -> Bool {
        return lhs.w < rhs.w
    }
}

extension ComparableEdge: Hashable {}

func solution() {
    
    // your main logic (input processing, algorithm, etc.)
    
    /// create adj list by input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    /// num of vertices
    let n = firstLine[0]
    /// num of pipe
    let m = firstLine[1]
    /// cost of enhancer
    let d = firstLine[2]
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
    var inactiveList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
 
    /// all the active pipes
    for i in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!
        /// check if in active edge
        if i >= n - 1 {
            inactiveList[u].append((v, w))
            inactiveList[v].append((u, w))
        }
        adjList[u].append((v, w))
        adjList[v].append((u, w))
    }
    //[[], [(v: 2, w: 1), (v: 4, w: 1)], [(v: 1, w: 1), (v: 3, w: 2)], [(v: 2, w: 2), (v: 4, w: 1)], [(v: 3, w: 1), (v: 1, w: 1)]]
    print(adjList)
    //[[], [(v: 4, w: 1)], [], [], [(v: 1, w: 1)]]
    print(inactiveList)

//    /// store picked vertex
//    var picked = [Int]()
    /// count activated
    var activated = 0
  
    print(adjList[1])
    print(adjList[1][0].v)
    
    func helperPrimMST(_ graph: [[(v: Int, w: Int)]]) -> (Int, [ComparableEdge]) {
        let n = graph.count
        var mstEdges = [ComparableEdge]()
        var pq = PriorityQueue<ComparableEdge>(<)
        var visited = [Bool](repeating: false, count: n)
        print("visited: ",visited)
        visited[0] = true
        for edge in graph[1] {
            print(graph[1])
            pq.enqueue(ComparableEdge(v: edge.v, w: edge.w))
        }
        print("pq:", pq)
        while let edge = pq.dequeue() {
            /// if inactive contains the edge, activate count += 1
            if !visited[edge.v] {
//                if !checkIfActive(edge, inactiveList) {
//                    print("not inactive list")
//                    activated += 1
//                }
                print("edge: ", edge)

                
            mstEdges.append(edge)
                for e in graph[edge.v] {
                    pq.enqueue(ComparableEdge(v: e.v, w: e.w))
                }
            }
        }
        print("minimum days: ",activated)
        return (mstEdges.map { $0.w }.reduce(0, +), mstEdges)
    }
    
    
    
    var heaviest = 0
    /// Research the heaviest weight in the graph to use pipe enhancer
    if d != 0 {
        /// if d > the highest weight, switch
        for i in 1..<adjList.count {
            for j in 0..<adjList[i].count {
                var weight = (adjList[i][j].w)
                if weight > heaviest {
                    heaviest = weight
                }
            }
        }
        print(heaviest)
        for i in 1..<adjList.count {
            for j in 0..<adjList[i].count {
                var weight = (adjList[i][j].w)
                if weight == heaviest {
                    adjList[i][j].w = adjList[i][j].w - d
                }
            }
        }
    }
    print(adjList)
 
    /// Priority Queue, start from index 1
    /// dequeue, if its inactive array, activate count += 1
    /// add dequeued element into picked array
    /// when picked count == n -> over
    /// remain of priority Queue && active -> deactivate
    print("aaaa")
    print("MST result: ", helperPrimMST(adjList))
    print("activated: ", activated)
    
    
    // remove all your debugging print statements

    // print the result (make sure you follow the output specification)
    
}

// you can include as many helper functions as you want.

func checkIfActive(_ edge: ComparableEdge, _ inactiveList: [[(v: Int, w: Int)]])-> Bool {
    print("check if this active: ", edge) // ComparableEdge(v: 2, w: 2)
       // inactiveList: [[], [(v: 4, w: 1)], [], [], [(v: 1, w: 1)]]
    for i in 1..<inactiveList.count-1{
        print("v, w: ", inactiveList[i][0].v, inactiveList[i][0].w)
        if edge.v == inactiveList[i][0].v && edge.w == inactiveList[i][0].w {
            return false
        }
    }
    return true
}

// make sure you run the function (before you submit)
//solution()
