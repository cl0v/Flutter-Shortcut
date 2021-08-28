
/// Usage example : 
/// 
/// ```dart
/// enum Size {
///  small,
///  medium,
///  large
/// }
///
/// Size size = stringToEnum<Size>("medium", Size.values);
///```


T stringToEnum<T>(String str, Iterable<T> values) {
  return values.firstWhere(
    (value) => value.toString().split('.')[1] == str,
  );
}