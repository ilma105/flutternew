import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseNoteRepo{
static void savenote(String notetitle,String notetext)async{
  if(notetitle.isEmpty || notetext.isEmpty){

        return;

      }
      Map<String,dynamic> data={
        "title": notetitle,
        "text": notetext,

      };
    await  FirebaseFirestore.instance.collection("notes").add(data);

    
}
 static Stream<QuerySnapshot<Map<String, dynamic>>> getnotes(){
    return FirebaseFirestore.instance.collection("notes").snapshots();

  }
  static void deletenotes(String id)async{
     await FirebaseFirestore.instance.collection("notes").doc(id).delete();

  }
 static  void updatenotes(String id,String notetitle,String notetext )async{
    Map<String,dynamic> data={
        "title":notetitle,
        "text":notetext,

      };
 await FirebaseFirestore.instance.collection("notes").doc(id).update(data);
  }
  
  
  
  
  
  
}