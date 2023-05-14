import 'package:flutter/material.dart';
import 'package:ip_info/data/ip_data.dart';
import 'package:ip_info/widgets/My_button.dart';
import 'package:ip_info/widgets/infotitletext.dart';

import 'widgets/infotext.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
TextEditingController ipinp=TextEditingController();
String ipaddress="no ip";
String city="none";
String region="none";
String country="none";
String latlong="none";
String operator="none";
String postal="none";
String time="none";




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff0f0b17),
            image: DecorationImage(image: AssetImage("assests/Group 21.png"))
          ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children:[
            Image.asset('assests/Group 46.png',height: 120.0,),
          
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0),
            child:  TextField(
              controller: ipinp,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                fillColor: Color(0xff432D83),
                filled: true 
              ),
            ),
          ),
         
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
                 
            Mybutton(


              text:"My Ip",
          ima: Image.asset('assests/du.png',
          width: 30.0,),
          
          onPresed:() async {
  String ipadd=  await Ipdata.getmyip();
    ipinp.text=ipadd;

setState(() {
ipaddress=ipadd;
});
          },
            ),
            SizedBox(width: 20.0,),
            Mybutton(text:"Get Info",
          ima: Image.asset('assests/ss.png',
          width: 30.0,),
         
          onPresed:()async{
Map ipinfo=await Ipdata.getinfo(ipinp.text);
setState(() {
   city=ipinfo["city"];
 region=ipinfo["region"];
 country=ipinfo["country"];
 latlong=ipinfo["loc"];
 operator=ipinfo["org"];
 postal=ipinfo["postal"];
 time=ipinfo["timezone"];



});

print(ipinfo);

          }
          ),
            
          //  Text("Get Info"),
          //       Image.asset('assests/ss.png',width: 34.0,),],
          
          
          
          ]),
         ),
         
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 24.0),
           child: Column(children: [
            Text("Information about the ip",style: TextStyle(color: Colors.white,fontSize: 15.0),),
           Text("${ipinp.text}",style: TextStyle(color: Colors.white,fontSize: 22.0),)
           
           ],),
         ),
         Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
children: [
  Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Infotitletext(text:"City"),
      
        Infotitletext(text:"Region"),
      Infotitletext(text:"Country"),
      
        Infotitletext(text:"Lat and Long"),
      Infotitletext(text:"Operator"),
      
        Infotitletext(text:"Postal Code"),
      Infotitletext(text:"Time Zone"),
      
        
      ],
    ),
  ),
 
Expanded(
  flex: 1,
  child:   Padding(
    padding: const EdgeInsets.only(left:10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
   

        children: [
      Infotext(text:"$city"),
      Infotext(text:"$region"),
     Infotext(text:"$country"),
      Infotext(text:"$latlong"),
Infotext(text: "${operator.length >= 10 ? operator.substring(0, 10) : operator}"),
     Infotext(text:"$postal"),
     Infotext(text:"$time"),
      ],
    
    
    
      ),
  ),
)



],
         )
          ],
        ),
        ),
      ),
    );
  }
}

