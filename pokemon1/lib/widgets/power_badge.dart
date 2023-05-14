import 'package:flutter/material.dart';

class powerbadge extends StatelessWidget {
  final String text;
  const powerbadge({
    super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 3.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(26.0),
            color: Colors.white.withOpacity(0.3),

      ),
      padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
    child: SingleChildScrollView(child: Text(text,style: TextStyle(color: Colors.white),)),);
  }
}