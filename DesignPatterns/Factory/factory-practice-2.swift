import Foundation

protocol Character {
    func attack()
    func defend()

    var HP:Int { get }
    var MP:Int { get }
    var weaponType:String { get }
    var armorType:String { get }
}

enum CharacterType {
    case warrior
    case mage
    case archer
}

enum CharacterError: Error {
    case invalidCharacterType
    case characterCreationFailed
}

class Warrior: Character {
    func attack() {
        print("Warrior on attack now.")
    }

    func defend() {
        print("Warrior is defending.")
    }

    var HP:Int {
        return 100
    }

    var MP:Int {
        return 57
    }

    var weaponType:String {
        return "Sword"
    }

    var armorType:String {
        return "Strong"
    }
}

class CharacterFactory { 
    static func createCharacter(character: CharacterType) throws -> Character {
        switch character {
            case .warrior:
                return Warrior()
            default:
                throw CharacterError.invalidCharacterType
        }
    }
}

class CharacterProcessor {
    private let character: Character

    init(characterType: CharacterType) throws {
        self.character = try CharacterFactory.createCharacter(character: characterType)
    }

    func attackOfCharacter() {
        character.attack()
        print("HP remaining: \(character.HP)")
        print("MP remaining: \(character.MP)")
    }

    func defendCharacter() {
        character.defend()
    }
}

let player = try CharacterProcessor(characterType: .warrior)

player.attackOfCharacter()
