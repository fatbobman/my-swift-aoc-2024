import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: (left: [Int], right: [Int]) {
    let lines = data.components(separatedBy: .newlines)
    let capacity = lines.count

    var left = [Int]()
    var right = [Int]()
    left.reserveCapacity(capacity)
    right.reserveCapacity(capacity)

    let pairs = lines.map { line -> (Int, Int) in
      let numbers = line.split(separator: "   ").compactMap { Int($0) }
      guard let first = numbers.first, let second = numbers.last else {
        fatalError("Invalid input")
      }
      return (first, second)
    }
    left = pairs.map { $0.0 }
    right = pairs.map { $0.1 }
    return (left.sorted(by: <), right.sorted(by: <))
  }

  var appears: [(value: Int, count: Int)] {
    var countCount = [Int: Int]()
    return entities.left.map { leftValue in
      if let count = countCount[leftValue] {
        return (value: leftValue, count: count)
      } else {
        let count = entities.right.count { $0 == leftValue }
        countCount[leftValue] = count
        return (value: leftValue, count: count)
      }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    zip(entities.left, entities.right).map { abs($0 - $1) }.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    appears.reduce(0) { $0 + $1.value * $1.count }
  }
}
