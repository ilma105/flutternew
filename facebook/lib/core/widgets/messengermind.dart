import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final double borderRadius;
  final  onTap;

  const MyBox({
    Key? key,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        
        child: Container(
          
          width: 250,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[500]!,
              width: 1.0,
            ),
                        borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 12.0,top: 10.0),
            child: Text(
              'What\'s on your mind',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
