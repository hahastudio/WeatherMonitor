import 'dart:convert';

void printObject(Object object) {
  // Encode your object and then decode your object to Map variable
  Map jsonMapped = json.decode(jsonEncode(object));

  // Using JsonEncoder for spacing
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');

  // encode it to string
  String prettyPrint = encoder.convert(jsonMapped);

  // print or debugPrint your object
  print(prettyPrint);
}