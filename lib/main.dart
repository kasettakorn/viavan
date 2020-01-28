import 'package:flutter/material.dart';
import 'package:viavan/pages/homepage.dart';
import 'package:viavan/pages/login.dart';
import 'package:viavan/pages/native.dart';
import 'package:viavan/services/service_locator.dart';


void main() {
  setupLocator(); runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      title: "ViaVan",
      routes: {'/homepage': (context) => HomePage(),
        '/native-page': (context) => NativePage()},

    );
  }
}
