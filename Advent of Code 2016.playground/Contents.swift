import UIKit

var str = "Hello, playground"

// MARK: Example

let example1 = "R2, L3"

let example2 = "R2, R2, R2"

let example3 = "R5, L5, R5, R3"

func shortestPath(instructions: String) -> Int {
    enum TurnDirection: String {
        case left = "L"
        case right = "R"
    }
    
    enum CompassPoint {
        case north
        case east
        case south
        case west
        
        static func newDirection(starting: CompassPoint, turning: TurnDirection) -> CompassPoint {
            switch starting {
            case .north:
                return turning == .left ? .west : .east
            case .east:
                return turning == .left ? .north : .south
            case .south:
                return turning == .left ? .east : .west
            case .west:
                return turning == .left ? .south : .north
            }
        }
    }
    
    let splitInstructions = instructions.components(separatedBy: ", ")
    
    var heading = CompassPoint.north
    
    var x = 0
    var y = 0
    
    for var instruction in splitInstructions {
        let directionLetter = instruction.removeFirst()
        
        let stringDirection = String(directionLetter)
        
        guard let direction = TurnDirection(rawValue: stringDirection) else { continue }
        
        heading = CompassPoint.newDirection(starting: heading, turning: direction)
        
        guard let int = Int(instruction) else { continue }
        
        switch heading {
            case .north:
                y += int
            case .east:
                x += int
            case .south:
                y -= int
            case .west:
                x -= int
        }
    }
    
    let (absX, absY) = (abs(x), abs(y))
    
    return absX + absY
}

shortestPath(instructions: example1) // 5 (correct)
shortestPath(instructions: example2) // 2 (correct)
shortestPath(instructions: example3) // 12 (correct)

// MARK: Part 1

let puzzleInput = "R3, R1, R4, L4, R3, R1, R1, L3, L5, L5, L3, R1, R4, L2, L1, R3, L3, R2, R1, R1, L5, L2, L1, R2, L4, R1, L2, L4, R2, R2, L2, L4, L3, R1, R4, R3, L1, R1, L5, R4, L2, R185, L2, R4, R49, L3, L4, R5, R1, R1, L1, L1, R2, L1, L4, R4, R5, R4, L3, L5, R1, R71, L1, R1, R186, L5, L2, R5, R4, R1, L5, L2, R3, R2, R5, R5, R4, R1, R4, R2, L1, R4, L1, L4, L5, L4, R4, R5, R1, L2, L4, L1, L5, L3, L5, R2, L5, R4, L4, R3, R3, R1, R4, L1, L2, R2, L1, R4, R2, R2, R5, R2, R5, L1, R1, L4, R5, R4, R2, R4, L5, R3, R2, R5, R3, L3, L5, L4, L3, L2, L2, R3, R2, L1, L1, L5, R1, L3, R3, R4, R5, L3, L5, R1, L3, L5, L5, L2, R1, L3, L1, L3, R4, L1, R3, L2, L2, R3, R3, R4, R4, R1, L4, R1, L5"

shortestPath(instructions: puzzleInput) // 300 (success)

// MARK: Part 2

func firstLocationVisitedTwice(instructions: String) -> CGPoint? {
    enum TurnDirection: String {
        case left = "L"
        case right = "R"
    }
    
    enum CompassPoint {
        case north
        case east
        case south
        case west
        
        static func newDirection(starting: CompassPoint, turning: TurnDirection) -> CompassPoint {
            switch starting {
            case .north:
                return turning == .left ? .west : .east
            case .east:
                return turning == .left ? .north : .south
            case .south:
                return turning == .left ? .east : .west
            case .west:
                return turning == .left ? .south : .north
            }
        }
    }
    
    let splitInstructions = instructions.components(separatedBy: ", ")
    
    var heading = CompassPoint.north
    
    var x = 0
    var y = 0
    
    var pointSet: [CGPoint] = [CGPoint(x: 0, y: 0)]
    
    for var instruction in splitInstructions {
        let directionLetter = instruction.removeFirst()
        
        let stringDirection = String(directionLetter)
        
        guard let direction = TurnDirection(rawValue: stringDirection) else { continue }
        
        heading = CompassPoint.newDirection(starting: heading, turning: direction)
        
        guard let int = Int(instruction) else { continue }
        
        switch heading {
        case .north:
            for _ in 0..<int {
                y += 1
                
                let newPoint = CGPoint(x: x, y: y)
                
                if pointSet.contains(newPoint) {
                    return newPoint
                } else {
                    pointSet += [newPoint]
                }
            }
        case .east:
            for _ in 0..<int {
                x += 1
                
                let newPoint = CGPoint(x: x, y: y)
                
                if pointSet.contains(newPoint) {
                    return newPoint
                } else {
                    pointSet += [newPoint]
                }
            }
        case .south:
            for _ in 0..<int {
                y -= 1
                
                let newPoint = CGPoint(x: x, y: y)
                
                if pointSet.contains(newPoint) {
                    return newPoint
                } else {
                    pointSet += [newPoint]
                }
            }
        case .west:
            for _ in 0..<int {
                x -= 1
                
                let newPoint = CGPoint(x: x, y: y)
                
                if pointSet.contains(newPoint) {
                    return newPoint
                } else {
                    pointSet += [newPoint]
                }
            }
        }
        
        
    }
    
    return nil
}

let example4 = "R8, R4, R4, R8"

let example = firstLocationVisitedTwice(instructions: example4)

func distanceToFirstLocationVisitedTwice(instructions: String) -> Int? {
    guard let point = firstLocationVisitedTwice(instructions: instructions) else { return nil }
    
    let (x, y) = (point.x, point.y)
    
    let (absX, absY) = (abs(x), abs(y))
    
    let total = absX + absY
    
    return Int(total)
}

distanceToFirstLocationVisitedTwice(instructions: example4) // 4 (correct)

distanceToFirstLocationVisitedTwice(instructions: puzzleInput) // 159 (correct)
