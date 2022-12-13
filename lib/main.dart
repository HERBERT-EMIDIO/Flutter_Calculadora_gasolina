import "package:flutter/material.dart";

import 'home_page.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gasolina Vs Alcool',
      home: HomePage(),
    );
  }
}
