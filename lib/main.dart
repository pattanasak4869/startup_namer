import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Namer',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Namer V.2'),
        ),
        body: const Center(
          child: const Text('my company'),
        ),
      ),
    );
  }
}