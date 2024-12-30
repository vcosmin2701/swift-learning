import Foundation

protocol Character {
    func attack()
    func defend()

    var HP: Int { get }
    var MP: Int { get }
    var weaponType: String { get }
    var armorType: String { get }
}

enum CharacterType {
    case warrior
}

class Warrior: Character {
    func attack() {
        print("Warrior on attack now.")
    }

    func defend() {
        print("Warrior is defending.")
    }

    var HP: Int {
        return 100
    }

    var MP: Int {
        return 57
    }

    var weaponType: String {
        return "Sword"
    }

    var armorType: String {
        return "Strong"
    }
}

class CharacterFactory { 
    static func createCharacter(character: CharacterType) -> Character {
        switch character {
            case .warrior:
                return Warrior()
        }
    }
}

class CharacterProcessor {
    func attackOfCharacter(character: CharacterType) {
        let character = CharacterFactory.createCharacter(character: character)
        character.attack()
    }
}

let gameShowcase = CharacterProcessor()

gameShowcase.attackOfCharacter(character: .warrior)
