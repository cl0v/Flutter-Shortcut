/// The Factory Method pattern, sometimes referred to as the
/// Virtual Constructor pattern, provides a way to conceal an object's
/// creation logic from client code, but the object returned is guaranteed
/// to adhere to a known interface. It's one of the most widely used
/// creational patterns, because it adds a lot of flexibility to your object
/// creation architecture without adding much complexity.

/// Simple example
enum ShapeType { triangle, rectangle }

abstract class Shape {
  factory Shape.triangle() => Triangle();
  factory Shape.rectangle() => Rectangle();

  void draw();
}

class Triangle implements Shape {
  @override
  void draw() {
    print("TRIANGLE");
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("RECTANGLE");
  }
}

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
