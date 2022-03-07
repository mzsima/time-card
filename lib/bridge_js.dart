@JS()
library hello;

import 'package:js/js.dart';

void helloJS() {
  hello();
}

@JS()
external void hello();