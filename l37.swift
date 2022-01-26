//https://leetcode.com/problems/sudoku-solver/

class Solution {

    var columns = Array<Set<Character>>(repeating: ["1","2","3","4","5","6","7","8","9"], count: 9)
    var rows = Array<Set<Character>>(repeating: ["1","2","3","4","5","6","7","8","9"], count: 9)
    var boxes = Array<Set<Character>>(repeating: ["1","2","3","4","5","6","7","8","9"], count: 9)

    var queue: PriorityQueue<Point>!
    func solveSudoku(_ board: inout [[Character]]) {
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                guard c != "." else { continue }
                columns[j].remove(c)
                rows[i].remove(c)
                boxes[boxIndex(i,j)].remove(c)
            }
        }
        queue = PriorityQueue<Point>(sort: self.queueSort)

        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    queue.enqueue(Point(i,j))
                }
            }
        }
        dfs(&board)
    }

    func dfs(_ board: inout [[Character]]) -> Bool {
            guard let p = queue.dequeue() else {
                return true
            }
            for c in candidates(p.i,p.j) {
                fill(c, p.i,p.j, &board)
                if dfs(&board) {
                    return true
                }
                unfill(p.i,p.j,&board)
            }
        queue.enqueue(p)
        return false
    }

    func fill(_ c: Character, _ i: Int, _ j: Int, _ board: inout [[Character]]) {
        board[i][j] = c
        columns[j].remove(c)
        rows[i].remove(c)
        boxes[boxIndex(i,j)].remove(c)
        for p in changedPoints(i,j) {
            let ind = queue.index(of: Point((p)))!
            queue.changePriority(index: ind, value: Point(p))
        }

    }

    func unfill(_ i: Int, _ j: Int, _ board: inout [[Character]]) {
        let c = board[i][j]
        if c == "." { return }
        board[i][j] = "."
        columns[j].insert(c)
        rows[i].insert(c)
        boxes[boxIndex(i,j)].insert(c)

        for p in changedPoints(i,j) {
            let ind = queue.index(of: Point(p))!
            queue.changePriority(index: ind, value: Point(p))
        }
    }

    func changedPoints(_ i: Int, _ j: Int) -> [(Int, Int)] {
        var ans = [(Int, Int)]()
        for k in 0..<9 {
            if let _ = queue.index(of: Point(k, j)), i != k {
                ans.append((k,j))
            }
        }
        for k in 0..<9 {
            if let _ = queue.index(of: Point(i, k)), k != j {
                ans.append((i, k))
            }
        }
        for p in boxPoints(boxIndex(i,j)) {
            if let _ = queue.index(of: Point(p)), p != (i,j) {
                ans.append(p)
            }
        }
        return ans
    }

    func queueSort(_ item1: Point, _ item2: Point) -> Bool {
        return candidates(item1.i, item1.j).count < candidates(item2.i, item2.j).count
    }

    func candidates(_ i: Int, _ j: Int) -> Set<Character> {
        return boxes[boxIndex(i,j)].intersection(columns[j]).intersection(rows[i])
    }

    func boxIndex(_ i: Int, _ j : Int) -> Int {
        let r = i/3, c = j / 3
        return 3*r + c
    }

    func boxPoints(_ boxIndex: Int) -> [(Int, Int)] {
        var ans = [(Int, Int)]()
        let r = boxIndex / 3, c = boxIndex % 3
        for k in 0..<9 {
            ans.append((r+k/3, c+k%3))
        }
        return ans
    }
}

struct Point: Equatable {
    let i: Int
    let j: Int
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
    init(_ p: (Int, Int)) {
        self.i = p.0
        self.j = p.1
    }
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.i == rhs.i && lhs.j == rhs.j
    }
}


public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  /*
    To create a max-priority queue, supply a > sort function. For a min-priority
    queue, use <.
  */
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }

  /*
    Allows you to change the priority of an element. In a max-priority queue,
    the new priority should be larger than the old one; in a min-priority queue
    it should be smaller.
  */
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

extension PriorityQueue where T: Equatable {
  public func index(of element: T) -> Int? {
    return heap.index(of: element)
  }
}

public struct Heap<T> {

  /** The array that stores the heap's nodes. */
  var nodes = [T]()

  /**
   * Determines how to compare two nodes in the heap.
   * Use '>' for a max-heap or '<' for a min-heap,
   * or provide a comparing method if the heap is made
   * of custom elements, for example tuples.
   */
  private var orderCriteria: (T, T) -> Bool

  /**
   * Creates an empty heap.
   * The sort function determines whether this is a min-heap or max-heap.
   * For comparable data types, > makes a max-heap, < makes a min-heap.
   */
  public init(sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
  }

  /**
   * Creates a heap from an array. The order of the array does not matter;
   * the elements are inserted into the heap in the order determined by the
   * sort function. For comparable data types, '>' makes a max-heap,
   * '<' makes a min-heap.
   */
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }

  /**
   * Configures the max-heap or min-heap from an array, in a bottom-up manner.
   * Performance: This runs pretty much in O(n).
   */
  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }

  public var isEmpty: Bool {
    return nodes.isEmpty
  }

  public var count: Int {
    return nodes.count
  }

  /**
   * Returns the index of the parent of the element at index i.
   * The element at index 0 is the root of the tree and has no parent.
   */
  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
  }

  /**
   * Returns the index of the left child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no left child.
   */
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
  }

  /**
   * Returns the index of the right child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no right child.
   */
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
  }

  /**
   * Returns the maximum value in the heap (for a max-heap) or the minimum
   * value (for a min-heap).
   */
  public func peek() -> T? {
    return nodes.first
  }

  /**
   * Adds a new value to the heap. This reorders the heap so that the max-heap
   * or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }

  /**
   * Adds a sequence of values to the heap. This reorders the heap so that
   * the max-heap or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }

  /**
   * Allows you to change an element. This reorders the heap so that
   * the max-heap or min-heap property still holds.
   */
  public mutating func replace(index i: Int, value: T) {
    guard i < nodes.count else { return }

    remove(at: i)
    insert(value)
  }

  /**
   * Removes the root node from the heap. For a max-heap, this is the maximum
   * value; for a min-heap it is the minimum value. Performance: O(log n).
   */
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }

    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      // Use the last node to replace the first one, then fix the heap by
      // shifting this new first node into its proper position.
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }

  /**
   * Removes an arbitrary node from the heap. Performance: O(log n).
   * Note that you need to know the node's index.
   */
  @discardableResult public mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }

    let size = nodes.count - 1
    if index != size {
      nodes.swapAt(index, size)
      shiftDown(from: index, until: size)
      shiftUp(index)
    }
    return nodes.removeLast()
  }

  /**
   * Takes a child node and looks at its parents; if a parent is not larger
   * (max-heap) or not smaller (min-heap) than the child, we exchange them.
   */
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)

    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }

    nodes[childIndex] = child
  }

  /**
   * Looks at a parent node and makes sure it is still larger (max-heap) or
   * smaller (min-heap) than its childeren.
   */
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1

    // Figure out which comes first if we order them by the sort function:
    // the parent, the left child, or the right child. If the parent comes
    // first, we're done. If not, that element is out-of-place and we make
    // it "float down" the tree until the heap property is restored.
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }

    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }

  internal mutating func shiftDown(_ index: Int) {
    shiftDown(from: index, until: nodes.count)
  }

}

// MARK: - Searching
extension Heap where T: Equatable {

  /** Get the index of a node in the heap. Performance: O(n). */
  public func index(of node: T) -> Int? {
    return nodes.index(where: { $0 == node })
  }

  /** Removes the first occurrence of a node from the heap. Performance: O(n). */
  @discardableResult public mutating func remove(node: T) -> T? {
    if let index = index(of: node) {
      return remove(at: index)
    }
    return nil
  }

}
