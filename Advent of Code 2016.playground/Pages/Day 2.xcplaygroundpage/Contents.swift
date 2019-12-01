import Foundation

var str = "Hello, playground"

extension Int {
    static let keypad = [[1,2,3],
                         [4,5,6],
                         [7,8,9]]
}

enum Direction: String {
    case U
    case D
    case L
    case R
}

enum DirectionError: Error {
    case directionNotFound(character: String)
}

func code(from string: String) throws -> String {
    var stringToReturn = ""
    
    var (x, y) = (1, 1)
    
    let lines = string.components(separatedBy: "\n")
    
    for line in lines {
        for character in line {
            let stringCharacter = String(character)
            guard let direction = Direction(rawValue: stringCharacter) else { throw DirectionError.directionNotFound(character: stringCharacter) }
            
            switch direction {
            case .U:
                if y > 0 {
                    y -= 1
                }
            case .D:
                if y < 2 {
                    y += 1
                }
            case .L:
                if x > 0 {
                    x -= 1
                }
            case .R:
                if x < 2 {
                    x += 1
                }
            }
        }
        
        let nextInt = Int.keypad[y][x]
        
        let nextString = String(nextInt)
        
        stringToReturn += nextString
    }
    
    return stringToReturn
}

let example = """
ULL
RRDDD
LURDL
UUUUD
"""

do {
    let exampleAnswer = try code(from: example)
    print(exampleAnswer)
} catch {
    print(error)
}

// MARK: - Part 1

let puzzleInput = """
RDLRUUULRRDLRLLRLDDUDLULULDDULUDRRUURLRLLUULDURRULLRULDRRDLLULLRLLDRLDDRRRRLLRLURRRDRDULRDUULDDDULURUDDRRRUULUDRLLUUURLUDRUUUDRDUULLRLLUDDRURRDDDRDLUUURLRLLUDRURDUDUULDDLLRDURULLLURLDURLUUULDULDDULULLLRRUDLRUURDRDLLURLUDULDUUUURRLDLUDRULUDLDLLDRLDDDRRLLDUDLLRRDDDRLUDURLLLDRUDDLDDRRLUDRRDUDLRRLULDULURULDULUULDRLLDRUUDDRLLUDRULLRRRLRDLRLUDLRULDRDLRDRLRULUDUURRUUULLDDDDUDDLDDDDRRULRDLRDDULLDLDLLDLLDLLDRRDDDRDDLRRDDDRLLLLURRDLRRLDRURDDURDULDDRUURUDUDDDRDRDDRLRRLRULLDRLDLURLRLRUDURRRDLLLUDRLRDLLDDDLLUDRLDRRUUDUUDULDULLRDLUDUURLDDRUDR
URULDDLDDUDLLURLUUUUUULUDRRRDDUDURDRUURLLDRURLUULUDRDRLLDRLDULRULUURUURRLRRDRUUUDLLLLRUDDLRDLLDUDLLRRURURRRUDLRLRLLRULRLRLRDLRLLRRUDDRLRUDULDURDLDLLLRDRURURRULLLDLLRRDRLLDUUDLRUUDDURLLLDUUDLRDDURRDRRULLDRLRDULRRLLRLLLLUDDDRDRULRRULLRRUUDULRRRUDLLUUURDUDLLLURRDDUDLDLRLURDDRRRULRRUDRDRDULURULRUDULRRRLRUDLDDDDRUULURDRRDUDLULLRUDDRRRLUDLRURUURDLDURRDUUULUURRDULLURLRUUUUULULLDRURULDURDDRRUDLRLRRLLLLDDUURRULLURURRLLDRRDDUUDLLUURRDRLLLLRLUDUUUDLRLRRLDURDRURLRLRULURLDULLLRRUUUDLLRRDUUULULDLLDLRRRDUDDLRULLULLULLULRU
DURUUDULRRLULLLDDUDDLRRDURURRRDDRRURDRURDRLULDUDUDUULULDDUURDDULRDUDUDRRURDRDDRLDRDRLDULDDULRULLDULURLUUDUDULRDDRRLURLLRRDLLDLDURULUDUDULDRLLRRRUDRRDDDRRDRUUURLDLURDLRLLDUULLRULLDDDDRULRRLRDLDLRLUURUUULRDUURURLRUDRDDDRRLLRLLDLRULUULULRUDLUDULDLRDDDDDRURDRLRDULRRULRDURDDRRUDRUDLUDLDLRUDLDDRUUULULUULUUUDUULDRRLDUDRRDDLRUULURLRLULRURDDLLULLURLUDLULRLRRDDDDDRLURURURDRURRLLLLURLDDURLLURDULURUUDLURUURDLUUULLLLLRRDUDLLDLUUDURRRURRUUUDRULDDLURUDDRRRDRDULURURLLDULLRDDDRRLLRRRDRLUDURRDLLLLDDDDLUUURDDDDDDLURRURLLLUURRUDLRLRRRURULDRRLULD
LLUUURRDUUDRRLDLRUDUDRLRDLLRDLLDRUULLURLRRLLUDRLDDDLLLRRRUDULDLLLDRLURDRLRRLURUDULLRULLLURRRRRDDDLULURUDLDUDULRRLUDDURRLULRRRDDUULRURRUULUURDRLLLDDRDDLRRULRDRDRLRURULDULRRDRLDRLLDRDURUUULDLLLRDRRRLRDLLUDRDRLURUURDLRDURRLUDRUDLURDRURLRDLULDURDDURUUDRLULLRLRLDDUDLLUUUURLRLRDRLRRRURLRULDULLLLDLRRRULLUUDLDURUUUDLULULRUDDLLDLDLRLDDUDURDRLLRRLRRDDUDRRRURDLRLUUURDULDLURULUDULRRLDUDLDDDUUDRDUULLDDRLRLLRLLLLURDDRURLDDULLULURLRDUDRDDURLLLUDLLLLLUDRDRDLURRDLUDDLDLLDDLUDRRDDLULRUURDRULDDDLLRLDRULURLRURRDDDRLUUDUDRLRRUDDLRDLDULULDDUDURRRURULRDDDUUDULLULDDRDUDRRDRDRDLRRDURURRRRURULLLRRLR
URLULLLDRDDULRRLRLUULDRUUULDRRLLDDDLDUULLDRLULRRDRRDDDRRDLRRLLDDRDULLRRLLUDUDDLDRDRLRDLRDRDDUUDRLLRLULLULRDRDDLDDDRLURRLRRDLUDLDDDLRDLDLLULDDRRDRRRULRUUDUULDLRRURRLLDRDRRDDDURUDRURLUDDDDDDLLRLURULURUURDDUDRLDRDRLUUUULURRRRDRDULRDDDDRDLLULRURLLRDULLUUDULULLLLRDRLLRRRLLRUDUUUULDDRULUDDDRRRULUDURRLLDURRDULUDRUDDRUURURURLRDULURDDDLURRDLDDLRUDUUDULLURURDLDURRDRDDDLRRDLLULUDDDRDLDRDRRDRURRDUDRUURLRDDUUDLURRLDRRDLUDRDLURUDLLRRDUURDUDLUDRRL
"""

do {
    let part1Answer = try code(from: puzzleInput)
    print(part1Answer) // 92435 (correct!)
} catch {
    print(error)
}

extension String {
    static let keypad = [[nil, nil, "1"],
                         [nil, "2", "3", "4"],
                         ["5", "6", "7", "8", "9"],
                         [nil, "A", "B", "C"],
                         [nil, nil, "D"]]
}

enum ChallengeError: Error {
    case invalidX(x: Int)
    case invalidY(y: Int)
    case nilString(x: Int, y: Int)
}

func code2(from string: String) throws -> String {
    var stringToReturn = ""
    
    var (x, y) = (0, 2)
    
    let lines = string.components(separatedBy: "\n")
    
    for line in lines {
        for character in line {
            let stringCharacter = String(character)
            guard let direction = Direction(rawValue: stringCharacter) else { throw DirectionError.directionNotFound(character: stringCharacter) }
            
            switch direction {
            case .U:
                switch x {
                case 0, 4:
                    break
                case 1, 3:
                    if y > 1 {
                        y -= 1
                    }
                case 2:
                    if y > 0 {
                        y -= 1
                    }
                default:
                    throw ChallengeError.invalidX(x: x)
                }
            case .D:
                switch x {
                case 0, 4:
                    break
                case 1, 3:
                    if y < 3 {
                        y += 1
                    }
                case 2:
                    if y < 4 {
                        y += 1
                    }
                default:
                    throw ChallengeError.invalidX(x: x)
                }
            case .L:
                switch y {
                case 0, 4:
                    break
                case 1, 3:
                    if x > 1 {
                        x -= 1
                    }
                case 2:
                    if x > 0 {
                        x -= 1
                    }
                default:
                    throw ChallengeError.invalidY(y: y)
                }
            case .R:
                switch y {
                case 0,4:
                    break
                case 1, 3:
                    if x < 3 {
                        x += 1
                    }
                case 2:
                    if x < 4 {
                        x += 1
                    }
                default:
                    throw ChallengeError.invalidY(y: y)
                }

//                print(x, y)
                
            }
        }
        
        
        guard let nextString = String.keypad[y][x] else { throw ChallengeError.nilString(x: x, y: y) }
        
        stringToReturn += nextString
    }
    
    return stringToReturn
}

do {
    let exampleAnswer = try code2(from: example) // 5DB3 (correct)
    print(exampleAnswer)
    
    let challengeAnswer = try code2(from: puzzleInput) // C1A88 (correct!)
    print(challengeAnswer)
} catch {
    print(error)
}
