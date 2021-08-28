
/// Practical example [Using extensions instead of implementation]
/// Use these named constructors to process diferent types of payment

enum PaymentType {
  creditCard,
  debitCard,
  cash,
  others,
}

abstract class Payment {
  factory Payment.debit() => DebitCardPayment();

  factory Payment.credit() => CreditCardPayment();

  factory Payment.cash() => CashPayment();

  void pay();
}

class CreditCardPayment implements Payment {
  @override
  void pay() {
    print('Paid with ${this.runtimeType}');
  }
}

class DebitCardPayment implements Payment {
  @override
  void pay() {
    print('Paid with ${this.runtimeType}');
  }
}

class CashPayment implements Payment {
  @override
  void pay() {
    print('Paid with ${this.runtimeType}');
  }
}

practicalUse() {
  final p1 = Payment.debit();
  final p2 = Payment.credit();
  final p3 = Payment.cash();

  p1.pay();
  p2.pay();
  p3.pay();
}
