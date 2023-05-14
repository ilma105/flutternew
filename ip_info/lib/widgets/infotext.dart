import 'package:flutter/material.dart';

class Infotext extends StatelessWidget {
  final String text;
  const Infotext({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Text("$text",style: TextStyle(fontSize: 15.0,color: Colors.white.withOpacity(0.4)),),
    );
  }
}

