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
    var count = 0
    for line in entities {
      if check(line: line) {
        count += 1
      }
    }
    return count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    entities.filter { line in
      check(line: line) || // 检查原始序列是否安全
      (0..<line.count).contains { index in // 尝试移除每个位置的数字
        var newLine = line
        newLine.remove(at: index)
        return check(line: newLine)
      }
    }.count
  }

  func check(line: [Int]) -> Bool {
    guard line.count >= 2 else { return false }
    let pairs = Array(zip(line, line.dropFirst()))
    let firstDiff = pairs[0].1 - pairs[0].0
    let isIncreasing = firstDiff > 0
    
    return pairs.allSatisfy { prev, next in
      let diff = next - prev
      if isIncreasing {
        return diff > 0 && diff <= 3
      } else {
        return diff < 0 && diff >= -3
      }
    }
  }
}
