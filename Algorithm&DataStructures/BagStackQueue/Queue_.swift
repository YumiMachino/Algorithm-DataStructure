//
//  Queue.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/15.
//

//import Foundation
///// The **Queue** class represents  collection  of data based on **first-in first-out(FIFO)** policy.
///// The policy of doing tasks in the same order that they arrive is one that we encounter frequently in everyday life; from people waiting in line at a theater, to cars waiting in line at a toll booth, to tasks waiting to be serviced by an application on your computer.
// ///Queues use FIFO or first-in first-out ordering, meaning the first element that was added will always be the first to be removed. Queues are handy when you need to maintain the order of your elements to process later.
/////Internally implemented using singly linked list
//
//public final class Queue_<E> : Sequence{
//
//    /// number of items on queue
//    private(set) var count: Int = 0
//
//    private var first: Node<E>? = nil
//
//    private var last: Node<E>? = nil
//
//    fileprivate class Node<E> {
//        fileprivate var item: E
//        fileprivate var next: Node<E>?
//        fileprivate init(item: E, next: Node<E>? = nil) {
//          self.item = item
//          self.next = next
//        }
//    }
//
//    /// create an empty queue (initializer)
//    public init() {}
//
//    /// add an item
//    public func enqueue(item: E) {
//        if isEmpty() {
//            first = Node<E>(item: item, next: nil)
//            last = first
//        } else {
//            let newNode = Node<E>(item: item, next: nil)
//            last!.next = newNode
//            last = newNode
//        }
//        count += 1
//    }
//
//    /// removes and returns the item least recently added to the queue
//    public func dequeue() -> E? {
//        first?.next = first
//        count -= 1
//        return first?.item
//    }
//
//    ///returns (but does not remove) the item least recently added to the queue.
//    public func peek() -> E? {
//        return first?.item
//    }
//
//
//    /// is the bag empty?
//    public func isEmpty() -> Bool {
//        return count == 0
//    }
//
//
//    public struct QueueIterator<E>: IteratorProtocol {
//        public typealias Element = E
//
//        private var current: Node<E>?
//
//        fileprivate init(_ current: Node<E>?) {
//            self.current = current
//        }
//
//        public mutating func next() -> E? {
//            if let item = current?.item {
//                current = current?.next
//                return item
//            }
//            return nil
//        }
//    }
//    ///Returns an iterator
//    public func makeIterator() -> QueueIterator<E> {
//        return QueueIterator<E>(first)
//    }
//}
//
//extension Queue_: CustomStringConvertible {
//    public var description: String {
//        return self.reduce(into: "") { $0 += "\($1), " }
//    }
//}
