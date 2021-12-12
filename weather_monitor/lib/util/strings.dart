/// Returns a string with capitalized first character.
///
/// Example:
///     print(capitalize("dart"));
///     => Dart
String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}