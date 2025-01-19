/*
 Enumaration - user-defined data type that consists of a group
 of related values
 */

// Example 1

enum Subjects {
    case Maths
    case Science
    case Social
    case English
    case Hindi
    case ComputerProgramming
}

var name: Subjects = .English

switch name {
case .English, .Hindi, .ComputerProgramming:
    print("Elective subjects")
case .Maths, .Science, .Social:
    print("Compulsory subjects")
}

// Example 2

enum Colors {
    case Black
    case Blue
    case MidnightGray
    case White
    case OffWhite
    case Silver
}

var color: Colors = .Blue

if color == .Blue {
    print("\(color) edition")
}


