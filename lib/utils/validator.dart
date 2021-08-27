class Validator {
  /// Validates most commons type of emails

  static String? email(String value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!regex.hasMatch(value)) return 'Please enter a valid email address.';
  }

  /// Validates most commons type of passwords

  static String? password(String value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (!regex.hasMatch(value))
      return 'Password must be at least 6 characters.';
  }

  /// Validates most commons type of names
  static String? name(String value) {
    RegExp regex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    if (!regex.hasMatch(value)) return 'Please enter a name.';
  }

  /// Validates most commons type of numbers

  static String? number(String value) {
    RegExp regex = RegExp(r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$');
    if (!regex.hasMatch(value)) return 'Please enter a number.';
  }
}
