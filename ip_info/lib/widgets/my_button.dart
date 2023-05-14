import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final Image ima;
  final onPresed;
  const Mybutton({
    super.key,required this.text,required this.ima,required this.onPresed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPresed,
    style: ButtonStyle(
      backgroundColor: 
      MaterialStatePropertyAll(Color(0xff775FC1)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      ),
      )
     ,child: Padding(
       padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 8.0),
       child: Row(
        children:[
             
          Text("$text",style: TextStyle(color: Color(0xff481E71),fontSize: 15.0),),
          SizedBox(width: 6.0,),
          ima
        ],
                 ),
     ),
    
    );
  }
}