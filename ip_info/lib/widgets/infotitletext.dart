import 'package:flutter/material.dart';

class Infotitletext extends StatelessWidget {
  final String text;
  const Infotitletext({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Text("$text",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}

