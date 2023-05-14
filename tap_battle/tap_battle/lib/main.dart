import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pinkscore=50;
  int greenscore=50;
  void pinkupdate(){
    setState(() {
    
    pinkscore+=1;
  greenscore-=1;
  });
  }
  void greenupdate(){
setState(() {
                greenscore+=1;
              pinkscore-=1;
              });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
       
        
        body: 
       Stack(
         children: [
           game(),
           
          if (pinkscore>=100 || greenscore>=100) Column(
             children: [
               Container(width: double.infinity,
               height: 500.0,
               color: Color.fromARGB(255, 209, 11, 28).withOpacity(0.7),
               child: Center(child: Text("${pinkscore>=100?"Pink":"Green"} won!!",style: TextStyle(fontSize: 40.0,color: Colors.white),)),
               ),
             ElevatedButton(onPressed: (){
              setState(() {
              pinkscore=50;
              greenscore=50;  
              });
              
              if(pinkscore==50 && greenscore==50){

              }

             }, child: Text("Restart")),
             
             ],
           ) ,
          if (pinkscore==50 || greenscore==50) game()
         ],
       )
    
      ),
    );
  }

  Column game() {
    return Column(children: [
          Expanded(
            flex: pinkscore,
            child: InkWell(
onTap: pinkupdate,

              child: Container(
                color: Color.fromARGB(255, 243, 33, 184),
              ),
            )),
            Expanded(
              flex: greenscore,
              child: 
            InkWell(
              
              onTap: greenupdate,
              child: Container(color: Color.fromARGB(255, 6, 105, 80),)))
         ],);
  }
}
