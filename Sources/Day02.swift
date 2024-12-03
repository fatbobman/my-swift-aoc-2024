import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    entities.count { line in
      check(line: line)
    }
  }

  func check(line: [Int]) -> Bool {
    guard line.count >= 2 else { return false }
    let diff = line[1] - line[0]
    let isForward = diff > 0
    let pairs = zip(line, line.dropFirst())
    return pairs.allSatisfy { current, next in
      let diff = next - current
      if isForward {
        return diff > 0 && diff < 4
      } else {
        return diff < 0 && diff > -4
      }
    }
  }

  func part2() -> Any {
    entities.count { line in
      check(line: line)
        || (0...line.count - 1).contains { index in
          var line = line
          line.remove(at: index)
          return check(line: line)
        }
    }
  }
}
