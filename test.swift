struct UserAccount {
    var userName: String
    var userAge: Int
    var isActive: Bool

    func printUserDetails() {
        print("\(userName) is \(userAge) years old")
        if isActive == true {
            print("Account is active")
        } else {
            print("Account is inactive")
        }
    }

    func calculateDiscount() -> Double {
        var discount: Double = 0.0
        if userAge > 60 {
            discount = 0.2
        } else if userAge > 30 {
            discount = 0.1
        }
        return discount
    }
}

let newUser = UserAccount(userName: "john", userAge: 25, isActive: true)
newUser.printUserDetails()
