import 'package:flutter/material.dart';
import 'package:modelclass/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Twitter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Twitter App Bar'),
        ),
        body: Home()
      ),
    );
  }
}

