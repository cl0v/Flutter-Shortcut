
/// Practical example [Using extensions instead of implementation]
/// Use these named constructors to process diferent types of payment

enum PaymentType {
  creditCard,
  debitCard,
  cash,
  others,
}

abstract class Payment {
  factory Payment.debit() => _DebitCardPayment();

  factory Payment.credit() => _CreditCardPayment();

  factory Payment.cash() => _CashPayment();

  void pay();
}

class _CreditCardPayment implements Payment {
  @override
  void pay() {
    print('Paid with ${this.runtimeType}');
  }
}

class _DebitCardPayment implements Payment {
  @override
  void pay() {
    print('Paid with ${this.runtimeType}');
  }
}

class _CashPayment implements Payment {
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
