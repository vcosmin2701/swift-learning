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

// RAW VALUES

// Each raw value must be unique

enum CarColor: Int {
    case Black = 2
    case Blue = 4
    case OffWhite = 5
    case Silver = 6
}

var colorCount = CarColor.Black.rawValue
print("Raw value of \(CarColor.Black): \(colorCount)")

enum SubjectMarks: Int {
    case maths = 40, english, hindi, physics
}

let marks = SubjectMarks.english.rawValue
print("Mark for \(SubjectMarks.english): \(marks)")

// Initializing from a raw value

enum InitEnum: String {
    case value1 = "Enum 1"
    case value2 = "Enum 2"
    case value3 = "Enum 3"
}

if let result = InitEnum(rawValue: "Enum 1") {
    print("Case '\(result)' is found for the given raw value")
} else {
    print("No match found")
}
