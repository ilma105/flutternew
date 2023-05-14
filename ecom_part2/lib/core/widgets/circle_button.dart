import 'package:flutter/material.dart';

import '../constraints/colors.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  const CircleButton({
    super.key,required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(50.0),
  border: Border.all(color: MyColors.bordercolor)

),   

child:icon        );
  }
}

