import 'package:flutter/material.dart';

import '../enums/box_state.dart';

class Boxicon extends StatelessWidget {
  final a;
  const Boxicon({super.key,required this.a});

  @override
  Widget build(BuildContext context) {
    return  a==Box.circle?const Icon(Icons.lens_outlined,size: 84.0,):a==Box.cross?
 const Icon(Icons.close,size: 84.0,):Container();
  }
}