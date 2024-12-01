import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: (left: [Int], right: [Int]) {
    var left: [Int] = []
    var right: [Int] = []
    let parts = data.split(separator: "\n").map {
      $0.split(separator: "   ").compactMap { Int($0) }
    }
    for part in parts {
      left.append(part[0])
      right.append(part[1])
    }
    return (left.sorted(by: <), right.sorted(by: <))
  }

  var appears: [Int: Int] {
    var appears: [Int: Int] = [:]
    for entity in entities.left {
      appears[entity, default: 0] = entities.right.count { $0 == entity }
    }
    return appears
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    zip(entities.left, entities.right).map { abs($0 - $1) }.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    // entities.map { $0.max() ?? 0 }.reduce(0, +)
    var sum = 0
    for entity in appears {
      sum += entity.key * entity.value
    }
    return sum
  }
}
