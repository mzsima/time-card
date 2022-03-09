@JS()
// library hello;
library out;

import 'package:js/js.dart';

@JS()
external void hello();

void retrieve() {
  retrieveFiles();
}

@JS()
external void retrieveFiles();