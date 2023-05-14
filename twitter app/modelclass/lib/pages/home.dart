import 'package:flutter/material.dart';
import 'package:modelclass/datas/datasources/tweet_data.dart';
import 'package:modelclass/datas/models/tweet_model.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 TextEditingController nameedit=TextEditingController();
 TextEditingController tweetedit=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    //sathe sathe load korar jonno
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){

                  showModalBottomSheet(context: context, builder: (context)=>Container(height: 300.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameedit,
                          decoration: InputDecoration(hintText: "Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: tweetedit,
                                 decoration: InputDecoration(hintText: "Your Tweet"),

                        ),
                      ),
                      ElevatedButton(onPressed: () async {
String name=nameedit.text;
String tweetel=tweetedit.text;
TweetModel tweetModel=TweetModel( writer:name,tweet:tweetel);
  await TweetData.posttwwet(tweetModel);

                      },
                       child: Text("post")),
                    ],
                  ),
                  )
                  
                  );
                }, child: Text("post a tweet")),
              ),
           
           Padding(padding: EdgeInsets.all(8.0),
           child: ElevatedButton(onPressed: (){
            setState(() {
              
            });
           }, 
           child: Text("Refresh")),),
           
            ],
          )),
        Expanded(
          flex: 10,
          child: FutureBuilder
          (future: TweetData.getAlltweets(),
            builder: (BuildContext context,AsyncSnapshot sn){
              if(sn.hasError){
              return Center(child: Text("error loading ${sn.error}"));
              }
               if(sn.hasData){
                List<TweetModel> tw=sn.data;
        return  ListView.builder(
          itemCount:tw.length,
          itemBuilder: (BuildContext context,int index)=>
        ListTile(
            leading: CircleAvatar(),
            title: Text("${tw[index].writer}"),
            subtitle: Text("${tw[index].tweet}"),
        
          )
          
          ); 
               }
               return Center(child: CircularProgressIndicator());
        
        
            }
        
            
            ),
        ),
      ],
    );
    //  return ListView.builder(
    //   itemCount: 10,
    //   itemBuilder:(BuildContext context,int  index) => Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ListTile(
    //       leading: CircleAvatar(
    //         backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
          
    //       ) ,
    //       title: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text("Sazia"),
      
    //           Text("2023-04-02T12:34:26.835Z",style: TextStyle(fontSize: 12.0),),
      
    //         ],
    //       ),
    //   subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    //     ),
    //   )
    //   );
 
  
  
  }
}