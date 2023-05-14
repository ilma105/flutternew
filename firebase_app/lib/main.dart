import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/repositories/firebasenotesrepo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  //for forebase setup these first 2 line
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),

    );
  }
}
class HomePage extends StatelessWidget {
   HomePage({super.key});
TextEditingController _titleedit=TextEditingController();
TextEditingController _textedit=TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

        showModalBottomSheet(context: context, builder: (context)=>Container(
          padding:const EdgeInsets.all(12.0),
          width: double.infinity,
child:  Column(

  children: [


   const  Text("write a note",style: TextStyle(fontSize: 30.0),),

      const SizedBox(height: 12.0,),


     TextField(
      controller: _titleedit,

  decoration: const InputDecoration(

  border: OutlineInputBorder(),

hintText: "Title of the note"),

    ),

   const SizedBox(height: 12.0,),

    TextField(
      controller: _textedit,


      maxLines: 3,


      decoration:const InputDecoration(


  border: OutlineInputBorder(),

hintText: "Text of the note"),
  ),

      const  SizedBox(height: 12.0,),

    ElevatedButton(onPressed:()=> FirebaseNoteRepo.savenote(_titleedit.text
    , _textedit.text), child:const Text("Save Note")),


  ],


),        )
);
      },child:const Icon(Icons.add),
      ),
      //streambuilder e live data dekhabe...eikhane data read kora dekhlam
      body: StreamBuilder(
        stream: FirebaseNoteRepo.getnotes(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text("error loading notes"),);

          }
          //snapshot e loading hoi tahole eita
          if(snapshot.connectionState== ConnectionState.waiting){

            return Center(child: Text(" loading notes"),);


          }
          //collection e kotogula data ache ta bole
          // return Center(child: Text(snapshot.data!.size.toString()));
          //data gula json format return kore
          // return Center(child: Text(snapshot.data!.docs.toString()));
          // return Center(child: Text(snapshot.data!.docs[6]["text"]));
return ListView.builder(
  itemCount: snapshot.data?.size?? 0,
  itemBuilder:(context,int index){
    return Container(width: double.infinity,
    decoration:BoxDecoration(    color: Color.fromARGB(255, 255, 68, 137),
borderRadius: BorderRadius.circular(12.0),

) ,
    padding: const EdgeInsets.all(12.0),
    margin: const EdgeInsets.all(12.0),

    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(snapshot.data!.docs[index]["title"],style: TextStyle(fontSize: 18.0),),
                 Text(snapshot.data!.docs[index]["text"],style: TextStyle(fontSize: 18.0),),
          ],
        ),
     
     Row(
       children: [
        IconButton(onPressed: (){
          //er fole textfield e je data dekhabe
          _titleedit.text=snapshot.data!.docs[index]["title"];
          _textedit.text=snapshot.data!.docs[index]["text"];
          showModalBottomSheet(context: context, builder: (context)=>Container(
          padding:const EdgeInsets.all(12.0),
          width: double.infinity,
child:  Column(

  children: [


   const  Text("Edit a note",style: TextStyle(fontSize: 30.0),),

      const SizedBox(height: 12.0,),


     TextField(

      controller: _titleedit,

  decoration: const InputDecoration(

  border: OutlineInputBorder(),

hintText: "Title of the note"),

    ),

   const SizedBox(height: 12.0,),

    TextField(
      controller: _textedit,


      maxLines: 3,


      decoration:const InputDecoration(


  border: OutlineInputBorder(),

hintText: "Text of the note"),
  ),

      const  SizedBox(height: 12.0,),

    ElevatedButton(onPressed:()=>FirebaseNoteRepo.updatenotes(snapshot.data!.docs[index].id, _titleedit.text
    , _textedit.text) , child:const Text("Update")),


  ],


),        )
);
          
          }, icon: Icon(Icons.edit)),
       
       
         IconButton(onPressed: (){
          
FirebaseNoteRepo.deletenotes(snapshot.data!.docs[index].id);      
          
          }, icon: Icon(Icons.delete)),
       
       
       
       ],
     )
     
      ],
    ),);
  } );

        },
      ),
      
   
    );
  }
}

