//
//  Stack.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/15.
//

import Foundation

///// **Stack** class represents a collection that is based on the last-in-first-out (LIFO) policy. When you click a hyperlink, your browser displays the new page (and pushes onto a stack). You can keep clicking on hyperlinks to visit new pages, but you can always revisit the previous page by clicking the back button (popping it from the stack).
///// Internally implemented using singly linked list
//public final class  Stack_<E> : Sequence{
//
//    /// store the data in the bottom
//    private var first: Node<E>? = nil
//    /// the element on the top
//    private var top: Node<E>? = nil
//
//    /// number of items in stack
//    private(set) var count: Int = 0
//
//    /// helper linked list node class
//    fileprivate class Node<E> {
//        fileprivate var item: E
//        fileprivate var next: Node<E>?
//        fileprivate init(item: E, next: Node<E>? = nil) {
//        self.item = item
//        self.next = next
//        }
//    }
//
//    /// create an empty stack (initializer)
//    init() {}
//
//    /// add an item
//    public func push(item: E) {
//        if count == 0 {
//            top = Node<E>(item: item, next: nil)
//            first = top
//        } else {
//            let oldTop = top
//            let newTop = Node<E>(item: item, next: nil)
//            oldTop?.next = newTop
//            top = newTop
//        }
//        count += 1
//    }
//
//    ///removes and returns the item most recently added to the stack
//    public func pop() -> E? {
//        if count == 1 {
//            let oldTop = top
//            top = nil
//            first = nil
//            return oldTop?.item
//        }
//        if count == 2 {
//            let oldTop = top
//            first?.next = nil
//            top = first
//            return oldTop?.item
//        } else {
//            /// when there is no element in the stack
//            guard !isEmpty() else {return nil}
//            let oldTop = top
//            top = nil
//            count = count - 1
//            return oldTop?.item
//        }
//    }
//
//    /// returns (but does not remove) the item most recently added to the stack.
//    public func peek() -> E? {
//        guard let top = top else { return nil}
//        return top.item
//    }
//
//    /// is the bag empty?
//    public func isEmpty() -> Bool {
//        return count == 0
//    }
//
//    /// iterator object
//    public struct StackIterator<E>: IteratorProtocol {
//
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
//
//
//    /// Returns an iterator
//    public func makeIterator() -> StackIterator<E> {
//        return StackIterator<E>(first)
//    }
//}
//
//extension Stack_: CustomStringConvertible {
//    public var description: String {
//        return self.reduce(into: "") { $0 += "\($1), " }
//    }
//}
