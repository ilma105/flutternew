import 'package:flutter/material.dart';
import 'package:pokemon/pages/details_page.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/widgets/pokemon_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
       home: HomePage(),
      // home: DetailsPage(),
    );
  }
}

