import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
    int c=0;

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[Text(c.toString(),style: TextStyle(fontSize: 40.0),
      
      ),
Row(
         mainAxisAlignment: MainAxisAlignment.center,

  children: [

  ElevatedButton(onPressed: (){setState(() {
    c=c+1;
  }); }, child: Text("increase")),
  SizedBox(width: 60.0,),
  ElevatedButton(onPressed: (){setState(() {
    c=c-1;
  });}, child: Text("decrease")),
  
  
],)

         ] );
  }
}