import 'package:flutter/material.dart';
import 'package:tic_toe/widgets/boxicon.dart';

import 'enums/box_state.dart';
import 'enums/game.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   bool iscross=true;
late String tex;
  //first row
Box a= Box.empty;

Box b= Box.empty;

Box c= Box.empty;

//2nd row
Box d= Box.empty;

Box e= Box.empty;

Box f= Box.empty;

//3rd row
Box g= Box.empty;

Box h= Box.empty;

Box i= Box.empty;
Game game=Game.notfinish;
void gamescoreupdate(){
  //first row
  if(a==b && b==c && a!=Box.empty){
    if(a==Box.circle){game=Game.circlewon;
    tex="Circle Won";

    }else{
      game=Game.crosswon;
          tex="Cross Won";

    }
 }
//2nd row
else if(d==e && e==f && d!=Box.empty){
    if(d==Box.circle){game=Game.circlewon;
              tex="Circle Won";


    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }

else if(g==h && h==i&& g!=Box.empty){
    if(g==Box.circle){game=Game.circlewon;
              tex="Circle Won";


    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }
//1 Col
else if(a==d && d==g&& d!=Box.empty){
    if(a==Box.circle){game=Game.circlewon;
          tex="Circle Won";

    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }
 //2 col
 else if(b==e && e==h&& b!=Box.empty){
    if(b==Box.circle){game=Game.circlewon;
              tex="Circle Won";


    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }
 //3 col
else if(c==f && f==i&& c!=Box.empty){
    if(c==Box.circle){game=Game.circlewon;
          tex="Circle Won";

    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }

 }
 //1 cross
 else if(a==e && e==i&& a!=Box.empty){
    if(a==Box.circle){game=Game.circlewon;
              tex="Circle Won";


    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }
 else if(c==e && e==g&& c!=Box.empty){
    if(c==Box.circle){game=Game.circlewon;
          tex="Circle Won";

    }else{
      game=Game.crosswon;
                tex="Cross Won";

    }
 }
  // else if(a!=b &&b!=c&&d!=e && a!=d && e!=f&&g!=h&&h!=i&&d!=g && b!=e&&e!=h && c!=f&&f!=i && a!=e&&e!=i && c!=e&&e!=g){}
    else if(a!=Box.empty &&b!=Box.empty&&c!=Box.empty&&d!=Box.empty &&e!=Box.empty&&f!=Box.empty&&g!=Box.empty &&h!=Box.empty&&i!=Box.empty){
      game=Game.draw;
      tex="Draw";
    }



}


void resetgame(){
  setState(() {
     a= Box.empty;

 b= Box.empty;

 c= Box.empty;

//2nd row
 d= Box.empty;

 e= Box.empty;

 f= Box.empty;

//3rd row
 g= Box.empty;

 h= Box.empty;

 i= Box.empty;

//reset game
 game=Game.notfinish;
  });


}
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex:1,
                  child: Center(child: Text("Turn: ${iscross?"Cross":"Circle"}",style: TextStyle(fontSize: 34.0),))),
                Expanded
                (
                  flex: 5,
                  child: GridView.count(crossAxisCount: 3,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                children: [
                InkWell(
                  onTap: (){print("a tap");
                  setState(() {
                    if(a==Box.empty){
                      if(iscross){
                        a=Box.cross;
                      }
                      else{
                        a=Box.circle;
                      }
                      iscross=!iscross;

                      gamescoreupdate();

                    }
                  });
                
                
                  },
                  child: Container(color:  Colors.blueAccent,
                child:Boxicon(a: a),
                  ),
                ),
                InkWell(
                                onTap: (){print("B tap");
                                
                                setState(() {
                    if(b==Box.empty){
                      if(iscross){
                        b=Box.cross;
                      }
                      else{
                        b=Box.circle;
                      }
                      iscross=!iscross;
                                            gamescoreupdate();

                   
                    }
                  });
                               
                               
                                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: b),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("C tap");
                                setState(() {
                    if(c==Box.empty){
                      if(iscross){
                        c=Box.cross;
                      }
                      else{
                        c=Box.circle;
                      }
                      iscross=!iscross;
                                           gamescoreupdate();
 
                             }
                  });
                               
                               
                                },

                  child: Container(color:  Colors.blueAccent,
                  child: Boxicon(a: c),
                
                
                  ),
                ),
                InkWell(
                                onTap: (){print("D tap");
                                
                                setState(() {
                    if(d==Box.empty){
                      if(iscross){
                        d=Box.cross;
                      }
                      else{
                        d=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                
                                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: d),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("e tap");
                                setState(() {
                    if(e==Box.empty){
                      if(iscross){
                        e=Box.cross;
                      }
                      else{
                        e=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                
                                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: e),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("f tap");
                                setState(() {
                    if(f==Box.empty){
                      if(iscross){
                        f=Box.cross;
                      }
                      else{
                        f=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                
                                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: f),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("g tap");
                                setState(() {
                    if(g==Box.empty){
                      if(iscross){
                        g=Box.cross;
                      }
                      else{
                        g=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: g),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("H tap");
                                setState(() {
                    if(h==Box.empty){
                      if(iscross){
                        h=Box.cross;
                      }
                      else{
                        h=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                
                                },

                  child: Container(color:  Colors.blueAccent,
                child: Boxicon(a: h),
                
                  ),
                ),
                InkWell(
                                onTap: (){print("i tap");
                               setState(() {
                    if(i==Box.empty){
                      if(iscross){
                        i=Box.cross;
                      }
                      else{
                        i=Box.circle;
                      }
                      iscross=!iscross;
                      gamescoreupdate();

                    }
                  });
                
                 },

                  child: Container(color:  Colors.blueAccent,
                  child: Boxicon(a: i),
                
                  ),
                ),
                
                ],
                  
                  ),
                ),
              ],
            ),
          
         game!=Game.notfinish? Container(width: double.infinity,height: double.infinity,color: Colors.greenAccent.withOpacity(0.7),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(tex,style: TextStyle(fontSize: 44.0),),),
             ElevatedButton(onPressed: ()=>resetgame(), child: Text("reset"))

            ],
          ),
          ):Container(),
          
          ],
        )
        ),
      );
    
  }
}
