import Foundation

protocol PaymentMethod {
    func processPayment(amount: Double)
    var fee: Double { get }
}

class CreditCard: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processing credit card payment of $\(amount)")
        print("Fee applied: $\(fee)")
    }
    
    var fee: Double {
        return 2.5
    }
}

class PayPal: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processing PayPal payment of $\(amount)")
        print("Fee applied: $\(fee)")
    }
    
    var fee: Double {
        return 3.0
    }
}

class BankTransfer: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processing bank transfer of $\(amount)")
        print("Fee applied: $\(fee)")
    }
    
    var fee: Double {
        return 1.0
    }
}

// Create the Factory

enum PaymentMethodType {
    case creditCard
    case paypal
    case bankTransfer
}

class PaymentMethodFactory {
    static func createPaymentMethod(type: PaymentMethodType) -> PaymentMethod {
        switch type {
        case .creditCard:
            return CreditCard()
        case .paypal:
            return PayPal()
        case .bankTransfer:
            return BankTransfer()
        }
    }
}

class PaymentProcessor {
    func processPayment(amount: Double, methodType: PaymentMethodType) {
        let paymentMethod = PaymentMethodFactory.createPaymentMethod(type: methodType)
        paymentMethod.processPayment(amount: amount)
    }
}

// Example usage

let processor = PaymentProcessor()

processor.processPayment(amount: 100.0, methodType: .creditCard)
processor.processPayment(amount: 50.0, methodType: .paypal)
processor.processPayment(amount: 1000.0, methodType: .bankTransfer)
